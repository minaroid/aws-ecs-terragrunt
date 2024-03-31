provider "aws" {
  region = var.region
}

data "aws_vpc" "default" {
  default = true
}

