# Create Source S3 Bucket
resource "aws_s3_bucket" "source_bucket" {
  bucket = var.source_bucket_name
}

# Upload initial.csv to Source S3 Bucket
resource "aws_s3_object" "initial_data" {
  bucket       = aws_s3_bucket.source_bucket.bucket
  key          = "initial_data.csv"
  source       = "${path.module}/data/initial_data.csv"
  content_type = "text/csv"
  etag         = filemd5("${path.module}/data/initial_data.csv")  # Optional: Ensures updates trigger re-upload
}
