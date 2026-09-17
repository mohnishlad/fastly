variable "fastly_api_token" {
  description = "Fastly API token used to manage the service."
  type        = string
  sensitive   = true
}

variable "service_name" {
  description = "Name of the Fastly service."
  type        = string
  default     = "mohnishlad-movie-reviews"
}

variable "domain_name" {
  description = "Primary hostname served by Fastly, usually www.example.com."
  type        = string
  default     = "www.mohnishlad.com"
}

variable "apex_domain" {
  description = "Apex domain to redirect to the www hostname."
  type        = string
  default     = "mohnishlad.com"
}

variable "bucket_name" {
  description = "Name of the Fastly object storage bucket used for the static site."
  type        = string
  default     = "mohnishlad-movie-reviews"
}

variable "object_region" {
  description = "Fastly object storage region to use for the site bucket."
  type        = string
  default     = "us-east"
}
