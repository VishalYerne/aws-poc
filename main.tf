terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket = "terraform-backend-bucket5"
    key    = "terraform/state"
    region = "us-east-1"
    default = "arn:aws:s3:::terraform-backend-bucket5"
  }
}

provider "aws" {
  region = "us-east-1"
}

# provider "aws" {
#   region = var.region
# }
