output "log_group_name" {
  value = aws_cloudwatch_log_group.ecs-task-log-group.name
}