provider "aws" {
  region = var.region
}

resource "aws_ecs_service" "ecs-service" {
  name                               = "${var.environment}-ecs-service"
  task_definition                    = var.ecs_task_definition_arn
  cluster                            = var.ecs_cluster_arn
  platform_version                   = "LATEST"
  scheduling_strategy                = "REPLICA"
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = var.ecs_desired_count
  capacity_provider_strategy {
    base              = 0
    capacity_provider = "FARGATE"
    weight            = 1
  }
  network_configuration {
    assign_public_ip = false
    security_groups  = var.ecs_task_security_groups
    subnets          = var.private_subnets_ids
  }
  load_balancer {
    container_name   = "${var.environment}-nodejs-express"
    container_port   = 3000
    target_group_arn = var.target_group_arn
  }

  deployment_controller {
    type = "ECS"
  }
  tags = {
    Environment = var.environment
  }
}