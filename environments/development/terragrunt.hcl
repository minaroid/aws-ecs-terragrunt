generate "backend" {
  path = "s3-backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  terraform {
    backend "s3" {
      bucket = "terraform-myapp-bucket-500"
      key    = "development/${path_relative_to_include()}/terraform.tfstate"
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
  ecs_desired_count    = 3
  ecs_max_count        = 10
  ecs_min_count        = 2
}
