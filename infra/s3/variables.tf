variable "aws_access_key_id" {
  description = "AWS access key used by GitHub Actions to provision the S3 bucket."
  type        = string
  sensitive   = true
}

variable "aws_secret_access_key" {
  description = "AWS secret key used by GitHub Actions to provision the S3 bucket."
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "AWS region for the S3 bucket."
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Globally unique name for the static site bucket."
  type        = string
}

variable "index_document" {
  description = "Default landing page for the static website."
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Fallback document served when an object is missing."
  type        = string
  default     = "index.html"
}
