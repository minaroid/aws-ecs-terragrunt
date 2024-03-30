provider "aws" {
  region = var.region
}
resource "aws_lb_target_group" "target-group" {
  name        = "${var.environment}-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 10
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  tags = {
    Environment = var.environment
  }
}