generate "backend" {
  path = "s3-backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  terraform {
    backend "s3" {
      bucket = "terraform-myapp-bucket-500"
      key    = "network/${path_relative_to_include()}/terraform.tfstate"
      region = "us-east-1"
    }
  }  
  EOF
}

inputs = {
  environment          = "development"
  region               = "us-east-1"
  availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_cidr_blocks   = ["172.31.128.0/20", "172.31.144.0/20", "172.31.160.0/20"]
  private_cidr_blocks  = ["172.31.112.0/20", "172.31.192.0/20", "172.31.208.0/20"]

  // public_subnets_ids  = ["subnet-0562d8f7f23146ae8", "subnet-02d23958b76e0f174", "subnet-064fad79038249e0d"]
  // private_subnets_ids = ["subnet-094632fd52aee88e6", "subnet-0b3b90bf485471e01", "subnet-0f98b3f585c4e1c55"]
  ecs_desired_count   = 3
  ecs_max_count       = 10
  ecs_min_count       = 2
}


// public cidrs
// - 172.31.128.0  - us-east-1a  - subnet-0562d8f7f23146ae8
// - 172.31.144.0	 - us-east-1b  - subnet-02d23958b76e0f174
// - 172.31.160.0  - us-east-1c  - subnet-064fad79038249e0d

// private cidrs
// - 172.31.112.0  - us-east-1a - subnet-094632fd52aee88e6
// - 172.31.192.0	 - us-east-1b - subnet-0b3b90bf485471e01
// - 172.31.208.0  - us-east-1c - subnet-0f98b3f585c4e1c55 