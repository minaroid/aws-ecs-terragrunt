
variable "environment" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}

variable "ecs_target_max_capacity" {
  type    = number
  default = 10
}

variable "ecs_target_min_capacity" {
  type    = number
  default = 1
}