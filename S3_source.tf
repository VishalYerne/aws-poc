resource "aws_s3_bucket" "source_bucket" {
  bucket = var.source_bucket_name
}

# Upload initial.csv to Source S3 Bucket
resource "aws_s3_object" "initial_data" {
  bucket = aws_s3_bucket.source_bucket.id
  key    = "Initial_data.csv"
  source = "${path.module}/data/initial.csv"
  content_type = "text/csv"
}
