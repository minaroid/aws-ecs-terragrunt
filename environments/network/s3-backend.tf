# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
  terraform {
    backend "s3" {
      bucket = "terraform-myapp-bucket-500"
      key    = "network/./terraform.tfstate"
      region = "us-east-1"
    }
  }  
