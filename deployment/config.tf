terraform {
  required_version = "~> 1.2.5"

  backend "s3" {
    bucket         = "hello-lambda-tfstate"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "hello-lambda-tfstate"
    encrypt        = true
  }

  required_providers {
    aws = {
      version = "~> 4.22.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}
