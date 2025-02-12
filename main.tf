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

resource "aws_s3_bucket" "example_bucket" {
  bucket = "bucket-foraws-2d4rt6777"
  acl    = "private"
}
