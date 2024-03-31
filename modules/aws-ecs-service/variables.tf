variable "ecs_task_definition_arn" {
  type = string
}

variable "ecs_cluster_arn" {
  type = string
}

variable "private_subnets_ids" {
  description = "subnets ids"
  type        = list(string)
}

variable "ecs_task_security_groups" {
  type        = list(string)
  description = "ecs task security groups"
}
variable "target_group_arn" {
  description = "trarget group arn"
}
variable "environment" {
  type = string
}

variable "region" {
  type = string
}
variable "ecs_desired_count" {
  type = number
}