resource "aws_instance" "ec2" {
  count             = 4 
  ami               = var.ami
  instance_type     = var.instance_type
  associate_public_ip_address = count.index < 2 ? true : false 
  
  subnet_id         = count.index < 2 ?  aws_subnet.subnets["public-subnet-1"].id : aws_subnet.subnets["private-subnet-1"].id
  security_groups   = count.index < 2 ? [aws_security_group.sg_ssh_open.id] : [aws_security_group.sg_vpc_cidr_only.id]

  tags = {
    Name = count.index < 2 ? "Pub_Instance-${count.index}" : "Priv_Instance-${count.index}"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips.txt" 
  }
}
