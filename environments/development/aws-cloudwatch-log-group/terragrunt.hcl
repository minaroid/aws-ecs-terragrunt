terraform {
  source = "../../../modules/aws-cloudwatch-log-group"
}

include "root" {
  path = find_in_parent_folders()
}  


