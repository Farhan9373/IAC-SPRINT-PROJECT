variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instance"
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
}

variable "db_username" {
  type        = string
  description = "Database username"
}

variable "db_password" {
  type        = string
  description = "Database password"
  sensitive   = true
}