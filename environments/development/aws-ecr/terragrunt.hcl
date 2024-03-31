terraform {
  source = "../../../modules/aws-ecr"
}

include "root" {
  path = find_in_parent_folders()
}  


