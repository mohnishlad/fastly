terraform {
  required_version = ">= 1.6.0"

  backend "remote" {
    organization = "mohnishlad"
    workspaces {
      name = "fastly"
    }
  }

  required_providers {
    fastly = {
      source  = "fastly/fastly"
      version = "~> 8.3"
    }
  }
}
