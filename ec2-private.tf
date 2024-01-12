module "ec2-private" {
  # META_ARGUMENTS depends_on
  depends_on = [module.vpc]
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "5.6.0"

  name          = "${var.environment}-private_ec2"
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  # used vpc-output file for reference 
  #subnet_ids = module.vpc.private_subnets
  # user security-group-output for it
  vpc_security_group_ids = [module.private_sg.security_group_id]
  #onstance_count = var.private_instance_count
  for_each  = toset(["0", "1"])
  subnet_id = element(module.vpc.private_subnets, tonumber(each.key))
  tags      = local.common_tags
  user_data = file("${path.module}/app1-install.sh")


}

