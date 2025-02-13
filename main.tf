terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket  = "my-terraform-test-bucket-2"
    key     = "terraform.tfstate"  # Defines where the state file will be stored
    region  = "us-east-1"
  
  }
}

provider "aws" {
  region = var.region
}