variable "instance_type" {
   description = "Instance type t2.micro"
   type        = string
   default     = "t2.micro"
}
variable "instance_count" {
  description = "EC2 instance count"
  type        = number
  default     = 1
} 
variable "enable_public_ip" {
  description = "Enable public IP address"
  type        = bool
  default     = true
}
variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3s"]
}

variable "project_environment" {
  description = "project name and environment"
  type        = map(string)
  default     = {
    project     = "project-alpha",
    environment = "dev"
  }
}
