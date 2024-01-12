# PUBLIC INSTANCE OUTPUTS

output "ec2_public_id" {
  description = "The ID of the instance"
  value       = module.ec2-public.id
}

output "ec2_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2-public.public_ip
}


# PRIVATE INSTANCE OUTPUTS

/*
output "ec2_private_id" {
  description = "The ID of the instance"
  value       = module.ec2-private.id
}

output "ec2_private_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2-private.private_ip
}

*/

output "ec2_private_instance_ids" {
  description = "List of IDs of instances"
  value       = [for ec2private in module.ec2-private : ec2private.id]
}

## ec2_private_ip
output "ec2_private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = [for ec2private in module.ec2-private : ec2private.private_ip]
}

