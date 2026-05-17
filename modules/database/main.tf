resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "iac-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "iac-db-subnet-group"
    Environment = "Dev"
    Project     = "IaC-Core-Cloud"
  }
}

resource "aws_db_instance" "mysql" {
  identifier           = "iac-mysql-db"
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name              = "iacdb"
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  skip_final_snapshot  = true
  publicly_accessible  = false
  deletion_protection  = false

  tags = {
    Name        = "iac-mysql-db"
    Environment = "Dev"
    Project     = "IaC-Core-Cloud"
  }
}