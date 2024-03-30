variable "ecs_task_definition_arn" {
  type    = string
  default = ""
}

variable "ecs_cluster_arn" {
  type    = string
  default = ""
}


variable "subnets_ids" {
  description = "subnets ids"
  type        = list(string)
  default     = []
}

variable "ecs_task_security_groups" {
  type        = list(string)
  default     = []
  description = "ecs task security groups"
}
variable "target_group_arn" {
  description = "trarget group arn"
}
variable "environment" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}

variable "max_size" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 2
}

variable "desired_capacity" {
  type    = number
  default = 2
}