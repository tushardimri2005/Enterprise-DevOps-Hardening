#!/bin/bash

yum update -y

amazon-linux-extras install epel -y

yum install -y \
git \
python3 \
tree

pip3 install --upgrade pip

amazon-linux-extras install ansible2 -y

echo "=================================" >> /etc/motd
echo "Enterprise DevOps Bastion Host" >> /etc/motd
echo "Environment: ${environment}" >> /etc/motd
echo "=================================" >> /etc/motd