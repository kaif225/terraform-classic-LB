module "load-balancer-sg" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "5.1.0"
  name                = "load-balancer-sg"
  vpc_id              = module.vpc.vpc_id
  ingress_rules       = ["http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]

  tags = local.common_tags
 ingress_with_cidr_block = [
    {
      from_port   = 81
      to_port     = 81
      protocol    = tcp
      cidr_blocks = ["0.0.0.0/0"]
    },
  ]
}

