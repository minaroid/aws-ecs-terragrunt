provider "aws" {
  region = var.region
}

resource "aws_ecs_task_definition" "ecs-task-definition" {
  family                   = "${var.environment}-task"
  execution_role_arn       = "arn:aws:iam::321397881832:role/ecsTaskExecutionRole"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

 runtime_platform {
    operating_system_family = "LINUX"
  }

  container_definitions = jsonencode([
    {
      name      = "${var.environment}-nginx-container"
      image     = "nginxdemos/hello"
      cpu       = 0
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
      
    }
  ])

  tags = {
    Environment = var.environment
  }
}