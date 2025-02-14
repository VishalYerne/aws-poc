# Ensure Source & Destination Buckets Exist
resource "aws_s3_bucket" "source_bucket" {
  bucket = var.source_bucket_name
}

resource "aws_s3_bucket" "dest_bucket" {
  bucket = var.dest_bucket_name
}

# Upload etl.py to Source S3
resource "aws_s3_object" "glue_script" {
  bucket       = aws_s3_bucket.source_bucket.bucket
  key          = "glue_scripts/etl.py"
  source       = "${path.module}/data/etl.py"
  content_type = "text/x-python"
}

# Create AWS Glue Job
resource "aws_glue_job" "glue_etl" {
  name     = "glue-etl-job"
  role_arn = var.glue_role_arn

  command {
    script_location = "s3://${aws_s3_object.glue_script.bucket}/${aws_s3_object.glue_script.key}"
    python_version  = "3"
  }

  default_arguments = {
    "--TempDir"       = "s3://${aws_s3_bucket.dest_bucket.bucket}/tmp/"
    "--source_bucket" = aws_s3_bucket.source_bucket.bucket
    "--dest_bucket"   = aws_s3_bucket.dest_bucket.bucket
  }

  timeout = 60  # Optional, ensures long jobs don’t fail early
}
