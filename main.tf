terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.31.0"  # ✅ Correct way to specify version
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
