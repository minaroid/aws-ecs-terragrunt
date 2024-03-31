provider "aws" {
  region = var.region
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = var.nat_eip_id
  subnet_id     = var.public_subnets_ids[0]
  tags = {
    Name : "${var.environment}-nat-gateway"
  }
}
