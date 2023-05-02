resource "aws_s3_bucket" "s3" {
  bucket = "${local.bucket}"
  tags = {
    name = "mine-bucket"
  }
}
locals {
  bucket = "${var.bucket-name}-${random_string.random.result}"
}
resource "random_string" "random" {
  length           = 6
  special          = false
  upper            = false
}

output "bucket-arn"{
  value = aws_s3_bucket.s3.arn
}
