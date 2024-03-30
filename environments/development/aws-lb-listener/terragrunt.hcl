terraform {
  source = "../../../modules/aws-lb-listener"
}

include "root" {
  path = find_in_parent_folders()
}  

dependency "aws-lb" {
  config_path = "../aws-lb"
}

dependency "aws-lb-target-group" {
  config_path = "../aws-lb-target-group"
}


inputs = {
  alb_arn            = dependency.aws-lb.outputs.alb_arn
  target_group_arn   = dependency.aws-lb-target-group.outputs.target_group_arn
}


