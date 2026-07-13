#Provider AWS
provider "aws" {
  region = var.region
}

#Tao EC2 instance t2.micro
resource "aws_instance" "dautq_instance" {
  ami           = var.image_id
  instance_type = var.instance_type
  key_name      = var.ssh_key_name
  vpc_security_group_ids = [aws_security_group.dautq_instance_sg.id ]
  tags = {
    Name = "TF-Dautq-Instance"
  }
}

#Tao mot security group de cho phep SSH
resource "aws_security_group" "dautq_instance_sg" {
  name        = "dautq_instance_sg"
  description = "dautq_instance_sg"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
