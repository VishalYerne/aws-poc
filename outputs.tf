output "source_bucket" {
  value = aws_s3_bucket.source_bucket.id
}

output "destination_bucket" {
  value = aws_s3_bucket.dest_bucket.id
}
