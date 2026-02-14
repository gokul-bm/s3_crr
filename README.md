# S3 Multi-Tier Lifecycle with Cross-Region Replication 

## Overview

This project provisions a production-grade Amazon S3 storage architecture using Terraform that implements:

- KMS encryption in both regions
- Cross-region replication (CRR)
- Multi-tier lifecycle management
- Object Lock (Compliance Mode)
- Least-privilege IAM replication role
- Encryption enforcement bucket policy
- SNS alerts on replication failure
- CloudWatch alarm for replication latency
- Remote Terraform backend with state locking

Primary Region: ap-south-1  
Replica Region: us-east-1  

---

#  Architecture Flow

1. File uploaded to primary bucket
2. Encrypted using AWS KMS
3. Replicated to replica region bucket
4. Lifecycle transitions applied (IA → Glacier → Deep Archive)
5. Replication failures trigger SNS email alerts
6. Replication latency monitored using CloudWatch
7. Objects protected using Compliance Object Lock

---

#  Features Implemented

- KMS encrypted S3 buckets (both regions)  
- Cross-region replication (CRR)  
- S3 versioning enabled  
- Multi-tier lifecycle transitions  
- Strict IAM replication role (no wildcard permissions)  
- Bucket policy enforcing KMS encryption  
- Object Lock (Compliance mode, 30 days retention)  
- SNS email notifications on replication failure  
- CloudWatch alarm for replication latency  
- Remote Terraform backend with state locking  

---

# Project Structure

modules/
- kms
- iam
- s3
- sns
- cloudwatch

prod/
- backend.tf
- providers.tf
- main.tf
- variables.tf
- terraform.tfvars

---

#  Deployment Steps

cd prod  
terraform init  
terraform plan  
terraform apply  
