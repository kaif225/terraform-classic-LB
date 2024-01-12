# Create VPC terraform Module

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.0"

  # VPC Basic details
  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr_block

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  # subnets for databse
  create_database_subnet_group       = var.create_db_subnet_group
  create_database_subnet_route_table = var.create_db_subnet_rt
  database_subnets                   = var.database_subnets
  #create_database_nat_gateway_route = true
  #create_database_internet_gateway_route = true

  # TO ENABLE OR NOT NAT GATEWAY FOR THE PRIVATE SUBNETS.
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  # VPC DNS PARAMETERS
  enable_dns_hostnames = var.dns_hostname
  enable_dns_support   = var.dns_support

  # TAGS
  public_subnet_tags = {
    Name = "public-subnet"
  }
  private_subnet_tags = {
    Name = "private-subnet"
  }
  database_subnet_tags = {
    Name = "database-subnet"
  }
  /*
  tags = {
    Owner       = "Kaif"
    Environment = "dev"
  }
*/
  # we have defined the tags in local-values.tf we will use it here
  tags = local.common_tags
  /*
  vpc_tags = {
    Name = "vpc-dev"
  }
*/

  vpc_tags = local.common_tags

}



