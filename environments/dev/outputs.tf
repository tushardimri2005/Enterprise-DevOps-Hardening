output "instance_id" {
  value = module.ec2.instance_id
}

output "private_ip" {
  value = module.ec2.private_ip
}

output "public_ip" {
  value = module.ec2.public_ip
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "ansible_user" {
  value = var.ansible_user
}

output "bastion_public_ip" {
  value = module.bastion.public_ip
}
output "bastion_private_ip" {
  value = module.bastion.private_ip
}