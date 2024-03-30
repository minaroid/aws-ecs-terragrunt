provider "aws" {
  region = var.region
}

// ALB instance 
resource "aws_security_group" "alb" {
  vpc_id      = var.vpc_id
  name        = "${var.environment}-alb"
  description = "Allow http inbound traffic and all outbound traffic"
  tags = {
    Name : "${var.environment}-alb"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb-allow-http-ipv4" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "alb-allow-all-traffic-ipv4" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


// App Server 
resource "aws_security_group" "ecs-task" {
  vpc_id      = var.vpc_id
  name        = "${var.environment}-ecs-task"
  description = "Allow http inbound traffic and all outbound traffic"
  tags = {
    Name : "${var.environment}-ecs-task"
  }
}

resource "aws_security_group_rule" "ecs-task-allow-http-ipv4" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.ecs-task.id
  source_security_group_id = aws_security_group.alb.id
}

resource "aws_vpc_security_group_egress_rule" "ecs-task-allow-all-traffic-ipv4" {
  security_group_id = aws_security_group.ecs-task.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}