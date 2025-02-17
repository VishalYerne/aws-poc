variable "region" {
  default = "us-east-1"
}

variable "source_bucket_name" {
  default = "source-s3-bucket-985"
}

variable "dest_bucket_name" {
  default = "dest-s3-bucket-985"
}

variable "glue_role_arn" {
  description = "IAM Role ARN for AWS Glue"
  default     = "arn:aws:iam::256487924128:role/glue_terraform"
}
