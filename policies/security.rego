package main

import rego.v1

deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "aws_db_instance"
  resource.change.after.publicly_accessible == true

  msg := "RDS database must not be publicly accessible."
}

deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"
  resource.change.after.instance_type != "t3.micro"

  msg := "Only t3.micro EC2 instances are allowed for cost control."
}

deny contains msg if {
  resource := input.resource_changes[_]
  resource.change.after.tags == null

  msg := "All resources must have tags for governance."
}

deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "aws_s3_bucket_public_access_block"
  resource.change.after.block_public_acls != true

  msg := "S3 bucket must block public ACLs."
}