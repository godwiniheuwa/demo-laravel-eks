# Terraform Remote State Datasource - Remote Backend AWS S3
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = var.s3_bucket_name
    key    = var.s3_bucket_key
    region = var.aws_region
  }
}

