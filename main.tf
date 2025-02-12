terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket         = "terraform-backend-bucket"
    key            = "terraform/state"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  region = var.region
}

<<<<<<< HEAD
resource "aws_s3_bucket" "example_bucket" {
  bucket = "bucket-foraws-2d4rt"
  acl    = "private"
=======
module "s3_source" {
  source = "./S3_source.tf"
}

module "s3_dest" {
  source = "./S3_dest.tf"
}

module "glue" {
  source        = "./Glue.tf"
  source_bucket = module.s3_source.bucket_id
  dest_bucket   = module.s3_dest.bucket_id
>>>>>>> 9699509 (Real Project)
}
