resource "aws_instance" "web" {
  ami           = "ami-0fcf52bcf5db7b003"
  instance_type = "t2.micro"
  key_name = "<key name>"
  vpc_security_group_ids = [aws_security_group.sg1.id]
  
  provisioner "file" {
    source = "<file location in your local>"
    destination = "/home/ubuntu/<file-name>"
  }
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("<key in terraform root directory>")
      timeout     = "4m"
   }
}
