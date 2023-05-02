module "s3" {
  source  = "./modules/module1"
  bucket-name = "any-name"

}
output "bucket-arn"{
  value = module.s3.bucket-arn
}

