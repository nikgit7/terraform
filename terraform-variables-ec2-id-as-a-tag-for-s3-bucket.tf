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
variable "tags" {
  description = "A mapping of tags to assign to the resource"

}
variable "abc" {
  description = "A mapping of tags to assign to the resource"

}
resource "aws_instance" "myfirstterraformec2" {
  ami           = "ami-02396cdd13e9a1257"
  instance_type = var.abc
  tags = {
    Name  = var.tags
  } 
}
resource "aws_s3_bucket" "s3" {
  bucket = "any-name-7887"
  tags = {
    owner = aws_instance.myfirstterraformec2.id
  }
output "instanceID" {
  value       = aws_instance.myfirstterraformec2.id

}
output "InstanceName" {
  value       = aws_instance.myfirstterraformec2.name
}
output "BucketName" {
  value       = aws_s3_bucket.s3.bucket_domain_name
  
}
