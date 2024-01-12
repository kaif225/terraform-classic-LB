# VPC input variables

variable "vpc_name" {
  type    = string
  default = "vpc-dev"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b"]

}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "database_subnets" {
  type    = list(string)
  default = ["10.0.151.0/24", "10.0.152.0/24"]
}

# boolean values
variable "create_db_subnet_group" {
  type    = bool
  default = true
}

variable "create_db_subnet_rt" {
  type    = bool
  default = true
}

variable "dns_hostname" {
  type    = bool
  default = true
}

variable "dns_support" {
  type    = bool
  default = true
}

variable "enable_nat_gateway" {
  type    = bool
  default = true
}

variable "single_nat_gateway" {
  type    = bool
  default = true
}



