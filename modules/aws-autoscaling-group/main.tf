provider "aws" {
  region = var.region
}
resource "aws_appautoscaling_target" "ecs-autoscaling-target" {
  max_capacity       = var.ecs_target_max_capacity
  min_capacity       = var.ecs_target_min_capacity
  resource_id        = "service/${var.environment}-ecs-cluster/${var.environment}-ecs-service"  // service/CLUSTER_NAME/SERVICE_NAME
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
  role_arn           = "arn:aws:iam::321397881832:role/aws-service-role/ecs.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_ECSService" 
}