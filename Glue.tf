# Upload etl.py to Source S3
resource "aws_s3_object" "glue_script" {
  bucket = aws_s3_bucket.source_bucket.id
  key    = "glue_scripts/etl.py"
  source = "${path.module}/data/etl.py"
  content_type = "text/x-python"
}

resource "aws_glue_job" "glue_etl" {
  name     = "glue-etl-job"
  role_arn = var.glue_role_arn

  command {
    script_location = "s3://${aws_s3_bucket.source_bucket.id}/glue_scripts/etl.py"
    python_version  = "3"
  }

  default_arguments = {
    "--TempDir" = "s3://${aws_s3_bucket.dest_bucket.id}/tmp/"
  }
}
