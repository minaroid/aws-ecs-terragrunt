terraform {
  source = "../../../modules/aws-ecs-task-definition"
}

include "root" {
  path = find_in_parent_folders()
}  


dependency "aws-cloudwatch-log-group" {
  config_path = "../aws-cloudwatch-log-group"
}

dependency "aws-ecr" {
  config_path = "../aws-ecr"
}

inputs = {
  log_group_name = dependency.aws-cloudwatch-log-group.outputs.log_group_name
  ecr_image_uri  = dependency.aws-ecr.outputs.ecr_image_uri
}