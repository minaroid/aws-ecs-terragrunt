provider "aws" {
  region = var.region
}

resource "aws_eip" "nat-eip" {
  domain = "vpc"
  tags = {
    Name : "${var.environment}-nat-eip"
  }
}
