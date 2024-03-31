terraform {
  source = "../../../modules/aws-nat-gateway"
}

include "root" {
  path = find_in_parent_folders()
}  


dependency "aws-eip" {
  config_path = "../aws-eip"
}

dependency "aws-subnet" {
  config_path = "../aws-subnet"
}

inputs = {
    nat_eip_id         = dependency.aws-eip.outputs.nat_eip_id
    public_subnets_ids = dependency.aws-subnet.outputs.public_subnets_ids
}