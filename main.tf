terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket = "terraform-backend-bucket"
    key    = "terraform/state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

module "s3_source" {
  source = "./"  
}

module "s3_dest" {
  source = "./"  
}


module "glue" {
  source        = "./"
  source_bucket = module.s3_source.source_bucket_id
  dest_bucket   = module.s3_dest.dest_bucket_id
}
