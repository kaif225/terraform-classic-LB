# Define local values in terraform 

locals {
  Owners      = var.business_division
  environment = var.environment
  name        = "${var.business_division}-${var.environment}"
  # its eg - HR-stag like this
  # we can also write the above name as 
  # name = "${local.Owners}-${local.environment}"
  common_tags = {
    Owners      = local.Owners
    environment = local.environment
  }
}
