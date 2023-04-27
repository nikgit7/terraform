variable "region" {
  default = "us-east-1"
}
variable "availability_zones" {
  type = list(any)
  default = ["us-east-1a","us-east-1b","us-east-1c"]
}
variable "public_subnets_cidr" {
  type = list(any)
  default = ["10.0.2.0/24","10.0.3.0/24"]
}

variable "private_subnets_cidr" {
  type = list(any)
  default = ["10.0.5.0/24","10.0.6.0/24"]
}
