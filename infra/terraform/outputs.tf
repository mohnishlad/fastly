output "service_name" {
  description = "Name of the created Fastly service."
  value       = fastly_service_vcl.site.name
}

output "service_id" {
  description = "ID of the created Fastly service."
  value       = fastly_service_vcl.site.id
}

output "domain" {
  description = "Primary hostname served by the Fastly service."
  value       = var.domain_name
}

output "origin_hostname" {
  description = "Hostname used as the S3 origin for the site."
  value       = var.origin_hostname
}
