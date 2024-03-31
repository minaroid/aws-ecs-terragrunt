output "private_subnets_ids" {
  value = [for subnet in aws_subnet.private-subnets : subnet.id]
}

output "public_subnets_ids" {
  value = [for subnet in aws_subnet.public-subnets : subnet.id]
}
