provider "aws" {
  region = var.region
}

resource "aws_lb" "alb" {
  name               = "${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"

  security_groups = var.alb_security_groups
  subnets         = var.subnets_ids

  tags = {
    Name = "${var.environment}-alb"
  }
}
