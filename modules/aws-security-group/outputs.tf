output "ecs_task_security_groups" {
  value = [aws_security_group.ecs-task.id]
}

output "alb_security_groups" {
  value = [aws_security_group.alb.id]
}