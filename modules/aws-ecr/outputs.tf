output "ecr_image_uri" {
  value = aws_ecr_repository.nodejs-express.repository_url
}