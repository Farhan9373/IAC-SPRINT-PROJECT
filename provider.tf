terraform {
  backend "s3" {
    bucket         = "iac-state-farhan-12345"
    key            = "core-cloud/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-lock-table"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}