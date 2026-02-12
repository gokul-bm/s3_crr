output "primary_kms_key_arn" {
  value = aws_kms_key.primary.arn
}

output "replica_kms_key_arn" {
  value = aws_kms_key.replica.arn
}