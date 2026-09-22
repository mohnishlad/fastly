sub custom_static_cache {
  if (req.url.ext ~ "^(css|js|png|jpg|jpeg|gif|svg|ico|webp|avif|woff|woff2|json)$" || req.url.path ~ "^/assets/") {
    unset req.http.Cookie;
    set req.grace = 1h;
  }

  if (req.url.path == "/" || req.url.ext == "") {
    unset req.http.Cookie;
    set req.grace = 1h;
  }
}

sub custom_backend_cache_tuning {
  if (bereq.url.ext ~ "^(css|js|png|jpg|jpeg|gif|svg|ico|webp|avif|woff|woff2|json)$" || bereq.url.path ~ "^/assets/" || bereq.url.path == "/") {
    set beresp.ttl = 1h;
    set beresp.stale_while_revalidate = 60s;
  }
}

sub custom_cache_headers {
  if (resp.http.Content-Type ~ "^(text/html|text/css|application/javascript|application/json|image/.*)$") {
    set resp.http.Cache-Control = "public, max-age=3600, s-maxage=3600";
  }
}
