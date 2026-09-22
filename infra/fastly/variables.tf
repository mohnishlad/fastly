variable "fastly_api_token" {
  description = "Fastly API token used to manage the service."
  type        = string
  sensitive   = true
}

variable "service_name" {
  description = "Name of the Fastly service."
  type        = string
  default     = "Mohnish Lad interview's website"
}

variable "domain_name" {
  description = "Primary hostname served by Fastly, usually www.example.com."
  type        = string
  default     = "www.mohnish.co"
}

variable "apex_domain" {
  description = "Apex domain to redirect to the www hostname."
  type        = string
  default     = "mohnish.co"
}

variable "origin_hostname" {
  description = "S3 website endpoint used as the Fastly origin. Example: my-bucket.s3-website-us-east-1.amazonaws.com"
  type        = string
  default     = "mohnishlad-movie-reviews.s3-website-us-east-1.amazonaws.com"
}

variable "newrelic_insert_key" {
  description = "New Relic Logs Ingest/License API key used by Fastly to stream log data."
  description = "New Relic Logs Ingest/License API key"
  type        = string
  sensitive   = true
}

variable "newrelic_region" {
  description = "New Relic region for log ingestion. Valid values are US and EU."
  description = "New Relic region for log ingestion (US or EU)"
  type        = string
  default     = "US"
}

