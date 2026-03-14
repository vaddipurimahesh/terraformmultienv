terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.33.0" # Terraform aws provider version
    }
  }
  backend "s3" {
    bucket = "goevops-s3"
    key = "godevops-workspace"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}

provider "aws" {
    region = "us-east-1"
}