
variable "alb_security_groups" {
  type        = list(string)
  default     = []
  description = "ELB security groups"
}

variable "subnets_ids" {
  description = "subnets ids"
  type        = list(string)
  default     = []
}

variable "environment" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}
