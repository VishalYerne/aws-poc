variable "source_bucket_name" {
  description = "Source S3 bucket for ETL"
  type        = string
  default     = "source-s3-bucket-123abc"
}

variable "dest_bucket_name" {
  description = "Destination S3 bucket for transformed data"
  type        = string
  default     = "dest-s3-bucket-123tgh"
}

variable "glue_role_arn" {
  description = "IAM Role ARN for AWS Glue"
  type        = string
  default     = "arn:aws:iam::661907950294:role/glue-connection-role"
}
