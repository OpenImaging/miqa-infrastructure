terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    heroku = {
      source  = "heroku/heroku"
      version = ">= 4.7"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}
