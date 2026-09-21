terraform {
  required_version = ">= 1.6.0"

  backend "remote" {
    organization = "mohnishlad"
    workspaces {
      name = "aws-s3"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
