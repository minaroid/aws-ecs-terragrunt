terraform {
  source = "../../../modules/aws-ecs-cluster"
}

include "root" {
  path = find_in_parent_folders()
}  


