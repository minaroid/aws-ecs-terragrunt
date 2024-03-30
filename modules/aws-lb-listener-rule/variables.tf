variable "alb_listener_arn" {
  description = "ALB listener arn"
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
