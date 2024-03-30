terraform {
  source = "../../../modules/aws-ecs-task-definition"
}

include "root" {
  path = find_in_parent_folders()
}  
