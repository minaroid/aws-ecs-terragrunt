terraform {
  source = "../../../modules/aws-lb-listener-rule"
}

include "root" {
  path = find_in_parent_folders()
}  


dependency "aws-lb-listener" {
  config_path = "../aws-lb-listener"
}

dependency "aws-lb-target-group" {
  config_path = "../aws-lb-target-group"
}

inputs = {
  alb_listener_arn   = dependency.aws-lb-listener.outputs.alb_listener_arn
  target_group_arn   = dependency.aws-lb-target-group.outputs.target_group_arn
}


