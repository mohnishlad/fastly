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
