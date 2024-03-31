provider "aws" {
  region = var.region
}

resource "aws_ecr_repository" "nodejs-express" {
  name                 = "nodejs-express"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
}