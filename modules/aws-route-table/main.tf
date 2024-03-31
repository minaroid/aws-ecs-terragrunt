provider "aws" {
  region = var.region
}

resource "aws_route_table" "private-route-table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_id
  }

  tags = {
    Name = "${var.environment}-private-rtb"
  }
}

resource "aws_route_table_association" "private-subnets-association" {
  count          = length(var.private_subnets_ids)
  subnet_id      = var.private_subnets_ids[count.index]
  route_table_id = aws_route_table.private-route-table.id
}

data "aws_vpc" "default" {
  default = true
}

data "aws_route_table" "public-route-table" {
  vpc_id = data.aws_vpc.default.id

  filter {
    name   = "association.main"
    values = ["true"]
  }
}

resource "aws_route_table_association" "public-subnets-association" {
  count          = length(var.public_subnets_ids)
  subnet_id      = var.public_subnets_ids[count.index]
  route_table_id = data.aws_route_table.public-route-table.id
}
