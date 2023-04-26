resource "aws_instance" "my-first-custom-vpc-ec2" {
  ami           = "ami-02396cdd13e9a1257"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public1-a.id
  associate_public_ip_address = true
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