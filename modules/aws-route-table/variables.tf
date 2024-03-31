variable "vpc_id" {
  description = "vpc id"
}


variable "nat_id" {
  description = "nat id"
}

variable "private_subnets_ids" {
  description = "private subnets ids"
  type        = list(string)
  default     = []
}

variable "public_subnets_ids" {
  description = "public subnets ids"
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
