variable "instance_type" {
  type    = string
  default = "t2.micro"
}


variable "instance_keypair" {
  type    = string
  default = "terraform-key"
}


variable "private_instance_count" {
  type    = list(number)
  default = [1]
}


