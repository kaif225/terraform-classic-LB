variable "aws_region" {
  type    = string
  default = "us-west-2"

}

# Environment Variable

variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "dev"
}

variable "business_division" {
  description = "Business Division in the large environment"
  type        = string
  default     = "HR"
}
