output "bucket_arn" {
  value = aws_s3_bucket.main.arn
  description = "S3 bucket ARN"
}

output "bucket_id" {
  value = aws_s3_bucket.main.id
  description = "Name of the S3 bucket"  # for s3 bucket, the bucket_id is also the name
}