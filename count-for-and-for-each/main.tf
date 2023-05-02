terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"


    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
 region  = "us-west-1"
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-0767046d1677be5a0"
   instance_type =  "t2.micro"
   count = 1

   tags = {
           Name = "Terraform EC2"
   }

}

variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}

output "print_the_names" {
  value = [for name in var.user_names : name]
}
// count
/* resource "aws_iam_user" "example" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}
*/

// for-each
/*resource "aws_iam_user" "example" {
  for_each = var.user_names
  name  = each.value
}
*/
// count
/* variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}
*/

// for-each
/* variable "user_names" {
  description = "IAM usernames"
  type        = set(string)
  default     = ["user1", "user2", "user3"]
  }
*/
