provider "fastly" {
  api_key = var.fastly_api_token
}

resource "fastly_object_storage_access_keys" "site" {
  description = "Access keys for the static movie review site bucket"
  permission  = "read-write-admin"
}

module "fos" {
  source = "./fos"

  bucket_name    = var.bucket_name
  access_key_id  = fastly_object_storage_access_keys.site.id
  secret_key     = fastly_object_storage_access_keys.site.secret_key
  object_region  = var.object_region
}

resource "fastly_service_vcl" "site" {
  name = var.service_name

  domain {
    name = var.domain_name
  }

  backend {
    name    = "object_storage"
    address = module.fos.object_storage_hostname
    port    = 443

    override_host     = module.fos.object_storage_hostname
    ssl_cert_hostname = module.fos.object_storage_hostname
    ssl_sni_hostname  = module.fos.object_storage_hostname
    use_ssl           = true
    max_conn          = 200
  }

  force_destroy = true

  snippet {
    name     = "redirect_apex_to_www"
    type     = "recv"
    priority = 100
    content  = <<-EOT
      if (req.http.host == "${var.apex_domain}") {
        return (redirect("https://${var.domain_name}" + req.url, 301));
      }
    EOT
  }

  snippet {
    name     = "cache_static_assets"
    type     = "recv"
    priority = 200
    content  = <<-EOT
      if (req.url.ext ~ "^(css|js|png|jpg|jpeg|gif|svg|ico|webp|avif|woff|woff2|json)$" || req.url.path ~ "^/assets/") {
        unset req.http.Cookie;
        set req.grace = 1h;
      }

      if (req.url.path == "/" || req.url.ext == "") {
        unset req.http.Cookie;
        set req.grace = 1h;
      }
    EOT
  }

  snippet {
    name     = "cache_ttl_for_static_content"
    type     = "fetch"
    priority = 200
    content  = <<-EOT
      if (bereq.url.ext ~ "^(css|js|png|jpg|jpeg|gif|svg|ico|webp|avif|woff|woff2|json)$" || bereq.url.path ~ "^/assets/" || bereq.url.path == "/") {
        set beresp.ttl = 1h;
        set beresp.stale_while_revalidate = 60s;
      }
    EOT
  }

  snippet {
    name     = "cache_headers"
    type     = "deliver"
    priority = 200
    content  = <<-EOT
      if (resp.http.Content-Type ~ "^(text/html|text/css|application/javascript|application/json|image/.*)$") {
        set resp.http.Cache-Control = "public, max-age=3600, s-maxage=3600";
      }
      if (obj.hits > 0) {
        set resp.http.X-Cache = "HIT";
      } else {
        set resp.http.X-Cache = "MISS";
      }
    EOT
  }
}
