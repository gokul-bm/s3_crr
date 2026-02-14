module "kms" {
  source = "../modules/kms"
  providers = {
    aws=aws
    aws.replica = aws.replica
  }
}

module "iam" {
  source = "../modules/iam"
  source_bucket_arn      = module.s3.primary_bucket_arn
  destination_bucket_arn = module.s3.replica_bucket_arn
  primary_kms_arn        = module.kms.primary_kms_key_arn
  replica_kms_arn        = module.kms.replica_kms_key_arn
}


module "sns" {
  source = "../modules/sns"
  email  = var.notification_email
  bucket_arn = module.s3.primary_bucket_arn
}

module "s3" {
  source = "../modules/s3"
  bucket_name          = var.bucket_name
  replica_bucket_name  = var.replica_bucket_name
  kms_key_arn          = module.kms.primary_kms_key_arn
  replica_kms_key_arn  = module.kms.replica_kms_key_arn
  replication_role_arn = module.iam.replication_role_arn
  sns_topic_arn        = module.sns.sns_topic_arn
  providers = {
    aws         = aws
    aws.replica = aws.replica
  }
}

module "cloudwatch" {
  source        = "../modules/cloudwatch"
  sns_topic_arn = module.sns.sns_topic_arn
  bucket_name   = var.bucket_name
}