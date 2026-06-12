resource "aws_security_group" "private_ec2_sg" {

  name = "${var.project_name}-${var.environment}-private-ec2-sg"

  description = "Private EC2 Security Group"

  vpc_id = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-private-ec2-sg"
    }
  )
}
resource "aws_vpc_security_group_ingress_rule" "private_ssh" {

  security_group_id = aws_security_group.private_ec2_sg.id

  referenced_security_group_id = aws_security_group.bastion_sg.id

  from_port = 22

  to_port = 22

  ip_protocol = "tcp"
}


# HTTPS

resource "aws_vpc_security_group_ingress_rule" "private_https" {
  security_group_id = aws_security_group.private_ec2_sg.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 443
  to_port = 443
  ip_protocol = "tcp"
}

# Outbound

resource "aws_vpc_security_group_egress_rule" "private_outbound" {
  security_group_id = aws_security_group.private_ec2_sg.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}
resource "aws_security_group" "bastion_sg" {

  name        = "${var.project_name}-${var.environment}-bastion-sg"

  description = "Security Group for Bastion Host"

  vpc_id = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-bastion-sg"
    }
  )
}
resource "aws_vpc_security_group_ingress_rule" "bastion_ssh" {

  security_group_id = aws_security_group.bastion_sg.id

  cidr_ipv4 = var.allowed_ssh_cidr

  from_port = 22

  to_port = 22

  ip_protocol = "tcp"
}
resource "aws_vpc_security_group_egress_rule" "bastion_outbound" {

  security_group_id = aws_security_group.bastion_sg.id

  cidr_ipv4 = "0.0.0.0/0"

  ip_protocol = "-1"
}