resource "aws_s3_bucket" "dest_bucket" {
  bucket = var.dest_bucket_name
}

output "bucket_id" {
  value = aws_s3_bucket.dest_bucket.id
}
