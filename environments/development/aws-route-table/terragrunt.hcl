terraform {
  source = "../../../modules/aws-route-table"
}

include "root" {
  path = find_in_parent_folders()
}  


dependency "aws-nat-gateway" {
  config_path = "../aws-nat-gateway"
}

dependency "aws-subnet" {
  config_path = "../aws-subnet"
}

dependency "aws-vpc" {
  config_path = "../aws-vpc"
}

inputs = {
    nat_id              = dependency.aws-nat-gateway.outputs.nat_id
    vpc_id              = dependency.aws-vpc.outputs.default_vpc_id
    public_subnets_ids  = dependency.aws-subnet.outputs.public_subnets_ids
    private_subnets_ids = dependency.aws-subnet.outputs.private_subnets_ids
}