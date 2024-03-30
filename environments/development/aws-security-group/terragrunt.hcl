terraform {
  source = "../../../modules/aws-security-group"
}

include "root" {
  path = find_in_parent_folders()
}  