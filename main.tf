terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket = "terraform-backend-bucket"
    key    = "terraform/state"
    region = "us-east-1"
    AWS_ACCESS_KEY_ID = "AKIATXN67EGQFLEWAOPB"
    AWS_SECRET_ACCESS_KEY = "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"
  }
}

provider "aws" {
  region = "us-east-1"
}

# provider "aws" {
#   region = var.region
# }
