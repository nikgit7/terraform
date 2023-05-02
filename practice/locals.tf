provider "aws" {
   region     = "eu-central-1"
}

locals {
  staging_env = "staging1"
}
locals {
  server_details = "${var.location}-${var.server_name}"
}


resource "aws_vpc" "staging-vpc" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.staging_env}-vpc-tag"
    Details = "${local.server_details}-vpc-tag"
  }
}

resource "aws_subnet" "staging-subnet" {
  vpc_id = aws_vpc.staging-vpc.id
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.staging_env}-subnet-tag"
    Details = "${local.server_details}-subnet-tag"
  }
}

resource "aws_instance" "ec2_example" {
   
   ami           = "ami-0767046d1677be5a0"
   instance_type = "t2.micro"
   subnet_id = aws_subnet.staging-subnet.id
   
   tags = {
           Name = "${local.staging_env} - Terraform EC2"
           Details = "${local.server_details}-tf EC2"
   }
}
