resource "aws_instance" "bastion" {

  ami           = var.ami
  instance_type = var.instance_type

  subnet_id = var.public_subnet_id

  associate_public_ip_address = true

  vpc_security_group_ids = [
    var.security_group_id
  ]

  key_name = var.key_name

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-bastion"
    }
  )
}