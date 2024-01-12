module "ec2-public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  # name = "${var.environment}-public_ec2"
  #instance_count = 1
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  # used vpc-output file for reference 
  subnet_id = module.vpc.public_subnets[0]
  # user security-group-output for it
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  tags                   = local.common_tags
}
