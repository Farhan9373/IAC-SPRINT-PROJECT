data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "iac-main-vpc"
    Environment = "Dev"
    Project     = "IaC-Core-Cloud"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name        = "iac-public-subnet"
    Environment = "Dev"
    Project     = "IaC-Core-Cloud"
  }
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr1
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name        = "iac-private-subnet-1"
    Environment = "Dev"
    Project     = "IaC-Core-Cloud"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr2
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name        = "iac-private-subnet-2"
    Environment = "Dev"
    Project     = "IaC-Core-Cloud"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "iac-internet-gateway"
    Environment = "Dev"
    Project     = "IaC-Core-Cloud"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "iac-public-route-table"
    Environment = "Dev"
    Project     = "IaC-Core-Cloud"
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}