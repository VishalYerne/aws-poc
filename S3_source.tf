resource "aws_s3_bucket" "source_bucket" {
  bucket = var.source_bucket_name
}

# Upload Initial_data.csv to Source_S3
resource "aws_s3_object" "initial_data" {
  bucket = aws_s3_bucket.source_bucket.id
  key    = "initial_data.csv"
  source = "./data/initial_data.csv"
  content_type = "text/csv"
}

# Upload etl.py to Source_S3
resource "aws_s3_object" "glue_script" {
  bucket = aws_s3_bucket.source_bucket.id
  key    = "glue_scripts/etl.py"
  source = "./data/etl.py"
  content_type = "text/x-python"
}

output "source_bucket_id" {
  value = aws_s3_bucket.source_bucket.id
}
