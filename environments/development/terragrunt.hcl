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
  environment         = "development"
  region              = "us-east-1"
  vpc_id              = "vpc-0cf57bbe2c3b5117d"
  subnets_ids         = ["subnet-0bf03fdbf00f02d76", "subnet-0302d46f3f1bae95b", "subnet-09716763cbb642adc"]
}

