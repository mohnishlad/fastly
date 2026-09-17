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

output "bucket_name" {
  description = "Name of the Fastly object storage bucket for the site."
  value       = var.bucket_name
}

output "object_region" {
  description = "Region used for the Fastly object storage bucket."
  value       = var.object_region
}

output "object_storage_access_key_id" {
  description = "Fastly object storage access key used to upload site content."
  value       = fastly_object_storage_access_keys.site.id
  sensitive   = true
}

output "object_storage_secret_key" {
  description = "Fastly object storage secret key used to upload site content."
  value       = fastly_object_storage_access_keys.site.secret_key
  sensitive   = true
}
