resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

    tags = {
    Name = "main_vpc"
  }
}

resource "aws_subnet" "public_subnets" {
  vpc_id     = aws_vpc.main_vpc.id
  
  count = length(var.public_subnets_cidr)
  cidr_block = element(var.public_subnets_cidr, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = format("public_subnet %d", count.index)
  }
}

resource "aws_subnet" "private_subnets" {
  vpc_id     = aws_vpc.main_vpc.id
  
  count = length(var.private_subnets_cidr)
  cidr_block = element(var.private_subnets_cidr, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = format("private_subnet %d", count.index)
  }
}

resource "aws_internet_gateway" "internet_gateway"  {
    vpc_id     = aws_vpc.main_vpc.id

tags = {
    Name = "gateway"
  }
}