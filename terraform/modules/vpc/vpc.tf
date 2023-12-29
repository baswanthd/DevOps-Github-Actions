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

resource "aws_route_table" "route_internet_gateway"  {
    vpc_id     = aws_vpc.main_vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }

    tags = {
        Name = "route_internet_gateway"
    }
}

resource "aws_route_table" "private"  {
    count = length(var.private_subnets_cidr)
    vpc_id     = aws_vpc.main_vpc.id
    
    tags = {
        Name = "private"
    }
}

resource "aws_route" "nat" {
  count = length(var.private_subnets_cidr)
  route_table_id            = element(aws_route_table.private.*.id, count.index) 
  destination_cidr_block    = "0.0.0.0/0"
  #vpc_peering_connection_id = "pcx-45ff3dc1"
  #depends_on                = [aws_route_table.testing]
  nat_gateway_id = element(aws_nat_gateway.bas_nat_gateway.*.id, count.index)
}

resource "aws_eip" "nat" {
  count = length(var.private_subnets_cidr)
  domain = "vpc"
  
}

resource "aws_nat_gateway" "bas_nat_gateway" {
  count = length(var.private_subnets_cidr)
  allocation_id = element(aws_eip.nat.*.id, count.index)
  subnet_id     = element(aws_subnet.public_subnets.*.id, count.index)

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}

resource "aws_route_table_association" "private" {
    count = length(var.private_subnets_cidr)
    subnet_id      = element(aws_subnet.private_subnets[*].id, count.index) 
    route_table_id = element(aws_route_table.private.*.id, count.index)
}


# resource "aws_route_table_association" "route_table_association" {
#     count = length(var.public_subnets_cidr)
#     subnet_id      = element(aws_subnet.public_subnets[*].id, count.index) 
#     route_table_id = element(aws_route_table.route_internet_gateway.*.id, count.index)
# }

