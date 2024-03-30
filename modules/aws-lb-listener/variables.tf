variable "alb_arn" {
  description = "ALB arn"
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
