terraform {
  source = "../../../modules/aws-autoscaling-group"
}

include "root" {
  path = find_in_parent_folders()
}  


dependency "aws-ecs-cluster" {
  config_path  = "../aws-ecs-cluster"
  skip_outputs = true 
}

dependency "aws-ecs-service" {
  config_path  = "../aws-ecs-service"
  skip_outputs = true 

}

 