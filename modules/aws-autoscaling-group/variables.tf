
variable "environment" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}

variable "ecs_max_count" {
  type    = number
  default = 10
}

variable "ecs_min_count" {
  type    = number
  default = 1
}