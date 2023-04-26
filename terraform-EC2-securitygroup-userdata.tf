terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}
provider "aws" {
  region  = "us-east-1"
}
resource "aws_security_group" "allow_22and80" {
  name        = "allow_22and80"
  description = "Allow 22 and 80"

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
      }

  tags = {
    Name = "allow22nad80"
  }
}
resource "aws_instance" "myfirstterraformec2" {
  ami           = "ami-02396cdd13e9a1257"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_22and80.id]
  user_data = <<EOF
#!/bin/bash
yum update -y
yum install nginx -y
systemctl start nginx
chmod 646 /usr/share/nginx/html/index.html
echo "hello this is my first terraform-server" > /usr/share/nginx/html/index.html
EOF
  tags = {
    Name  = "last"
  }
}
