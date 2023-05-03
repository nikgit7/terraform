resource "aws_instance" "web" {
  ami           = "ami-0fcf52bcf5db7b003"
  instance_type = "t2.micro"
  key_name = "nikhil"
  vpc_security_group_ids = [aws_security_group.sg1.id]
  
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
 }
}
