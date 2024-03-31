variable "availability_zones" {
  type    = list(string)
  default = []
}

variable "private_cidr_blocks" {
  type    = list(string)
  default = []
}

variable "public_cidr_blocks" {
  type    = list(string)
  default = []
}


variable "vpc_id" {
  description = "vpc id"
}


variable "environment" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}
