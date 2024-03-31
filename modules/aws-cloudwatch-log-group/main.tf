provider "aws" {
  region = var.region
}

resource "aws_cloudwatch_log_group" "ecs-task-log-group" {
  name = "${var.environment}-ecs-task"
  tags = {
    Environment = var.environment
  }
}