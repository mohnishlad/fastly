terraform {
  required_version = ">= 1.6.0"

  required_providers {
    fastly = {
      source  = "fastly/fastly"
      version = "~> 8.3"
    }
  }
}
