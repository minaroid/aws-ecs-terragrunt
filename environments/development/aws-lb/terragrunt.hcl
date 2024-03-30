terraform {
  source = "../../../modules/aws-lb"
}

include "root" {
  path = find_in_parent_folders()
}


dependency "aws-security-group" {
  config_path = "../aws-security-group"
}

inputs = {
  alb_security_groups  = dependency.aws-security-group.outputs.alb_security_groups
}
 


