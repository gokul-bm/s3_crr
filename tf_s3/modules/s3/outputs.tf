output "primary_bucket_name" {
  value = aws_s3_bucket.primary.bucket
}

output "replica_bucket_name" {
  value = aws_s3_bucket.replica.bucket
}

output "primary_bucket_arn" {
  value = aws_s3_bucket.primary.arn
}
