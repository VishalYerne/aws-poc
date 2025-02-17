output "source_bucket" {
  value = aws_s3_bucket.source_bucket.id
}

output "destination_bucket" {
  value = aws_s3_bucket.dest_bucket.id
}

output "glue_job_name" {
  value = aws_glue_job.glue_etl.name
}
