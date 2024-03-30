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
  desired_count                      = 3
  capacity_provider_strategy {
    base              = 0
    capacity_provider = "FARGATE"
    weight            = 1
  }
  network_configuration { 
    assign_public_ip = true
    security_groups  = var.ecs_task_security_groups
    subnets          = var.subnets_ids
  }
  load_balancer {
    container_name   = "${var.environment}-nginx-container"
    container_port   = 80
    target_group_arn = var.target_group_arn
  }

  deployment_controller {
    type = "ECS"
  }
  tags = {
    Environment = var.environment
  }
}