terraform {
  required_version = "~> 0.15.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.40.0"
    }
  }
}

provider "aws" {
  version = "> 3.0"
  region  = "ap-southeast-1"
}