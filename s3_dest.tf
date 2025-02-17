resource "aws_s3_bucket" "dest_bucket" {
  bucket = var.dest_bucket_name
}
