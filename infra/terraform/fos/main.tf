terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 6.0"
    }
  }
}

variable "bucket_name" {
  type = string
}

variable "access_key_id" {
  type = string
  sensitive = true
}

variable "secret_key" {
  type = string
  sensitive = true
}

variable "object_region" {
  type    = string
  default = "us-east"
}

provider "aws" {
  access_key = var.access_key_id
  secret_key = var.secret_key
  region     = "us-east"

  s3_use_path_style = true
  skip_credentials_validation = true
  skip_metadata_api_check = true
  skip_region_validation = true
  skip_requesting_account_id = true

  endpoints {
    s3 = "https://${var.object_region}.object.fastlystorage.app"
  }
}

resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name

  lifecycle {
    ignore_changes = [region]
  }
}

output "object_storage_hostname" {
  value = "${var.object_region}.object.fastlystorage.app"
}
