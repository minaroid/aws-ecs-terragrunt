provider "aws" {
  region = var.region
}
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = var.alb_arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    order            = 1
    target_group_arn = var.target_group_arn
    type             = "forward"
  }

}