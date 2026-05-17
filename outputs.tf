output "vpc_id" {
  value = module.network.vpc_id
}

output "ec2_public_ip" {
  value = module.compute.public_ip
}

output "s3_bucket_name" {
  value = module.storage.bucket_name
}

output "database_endpoint" {
  value = module.database.db_endpoint
}