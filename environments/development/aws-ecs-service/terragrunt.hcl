terraform {
  source = "../../../modules/aws-ecs-service"
}

include "root" {
  path = find_in_parent_folders()
}  

dependency "aws-ecs-task-definition" {
  config_path = "../aws-ecs-task-definition"
}

dependency "aws-ecs-cluster" {
  config_path = "../aws-ecs-cluster"
}

dependency "aws-lb-target-group" {
  config_path = "../aws-lb-target-group"
}

dependency "aws-security-group" {
  config_path = "../aws-security-group"
}

dependency "aws-subnet" {
  config_path = "../aws-subnet"
}

inputs = {
  ecs_task_security_groups   = dependency.aws-security-group.outputs.ecs_task_security_groups
  ecs_task_definition_arn    = dependency.aws-ecs-task-definition.outputs.ecs_task_definition_arn
  ecs_cluster_arn            = dependency.aws-ecs-cluster.outputs.ecs_cluster_arn
  target_group_arn           = dependency.aws-lb-target-group.outputs.target_group_arn
  private_subnets_ids        = dependency.aws-subnet.outputs.private_subnets_ids
}