provider "aws" {
  region = var.region
}

resource "aws_ecs_cluster" "ecs-cluster" {
  name = "${var.environment}-ecs-cluster"

  tags = {
    Environment = var.environment
  }
}