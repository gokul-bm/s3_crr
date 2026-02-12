variable "bucket_name" {
  type = string
}

variable "replica_bucket_name" {
  type = string
}

variable "kms_key_arn" {
  type = string
}

variable "replica_kms_key_arn" {
  type = string
}

variable "replication_role_arn" {
  type = string
}

variable "sns_topic_arn" {
  type = string
}