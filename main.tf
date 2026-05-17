module "network" {
  source               = "./modules/network"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  private_subnet_cidr1 = "10.0.2.0/24"
  private_subnet_cidr2 = "10.0.3.0/24"
}

module "compute" {
  source    = "./modules/compute"
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.public_subnet_id
  ami_id    = var.ami_id
}

module "storage" {
  source      = "./modules/storage"
  bucket_name = var.bucket_name
}

module "database" {
  source      = "./modules/database"
  subnet_ids  = [module.network.private_subnet_id1, module.network.private_subnet_id2]
  db_username = var.db_username
  db_password = var.db_password
}