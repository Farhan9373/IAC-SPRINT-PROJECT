provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "iac-state-farhan-12345"

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
    Project     = "IaC-Core-Cloud"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table"
    Environment = "Dev"
    Project     = "IaC-Core-Cloud"
  }
}