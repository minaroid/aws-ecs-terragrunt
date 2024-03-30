terraform {
  source = "../../../modules/aws-lb-target-group"
}

include "root" {
  path = find_in_parent_folders()
}  




