terraform {
  backend "s3" {
    bucket         = "terraform-prod-state-bucket-s3"
    key            = "s3-crr/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}