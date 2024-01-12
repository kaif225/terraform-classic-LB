# AWS EC2 Security group  Terraform module
# Security group for public Bastion Host

module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "public-bastion-sg"
  description = "sg with ssh port open for everyone"

  vpc_id = module.vpc.vpc_id
  # we took the vpc_id from the vpc-output.tf file 

  # ingress rules
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  # egress rules
  egress_rules = ["all-all"]
  tags         = local.common_tags
}

