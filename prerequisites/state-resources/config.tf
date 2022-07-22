terraform {
  required_version = "~> 1.2.5"
  
  required_providers {
    aws = {
      version = "~> 4.22.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}
