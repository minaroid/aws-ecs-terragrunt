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
      name      = "${var.environment}-nodejs-express"
      image     = "${var.ecr_image_uri}:${var.environment}"
      cpu       = 0
      memory    = 512
      essential = true
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = var.log_group_name
          awslogs-region        = var.region
          awslogs-stream-prefix = "ecs"
        }
      },
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
          protocol      = "tcp"
        }
      ]

    }
  ])

  tags = {
    Environment = var.environment
  }
}