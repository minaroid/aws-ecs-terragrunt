provider "aws" {
  region = var.region
}

resource "aws_subnet" "public-subnets" {
  count             = length(var.availability_zones)
  vpc_id            = var.vpc_id
  cidr_block        = var.public_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.environment}-public-${var.availability_zones[count.index]}"
  }
}

resource "aws_subnet" "private-subnets" {
  count             = length(var.availability_zones)
  vpc_id            = var.vpc_id
  cidr_block        = var.private_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.environment}-private-${var.availability_zones[count.index]}"
  }
}
