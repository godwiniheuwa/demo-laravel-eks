# Input Variables - Placeholder file
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = ""   
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "prod"
}
# Business Division
variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type = string
  default = "Services"
}
# S3 Bucket name
variable "s3_bucket_name" {
  description = "Bucket name that store the EKS Cluster State file"
  type = string
  default = ""
}

variable "s3_bucket_key" {
  description = "Bucket name that store the EKS Cluster State file"
  type = string
  default = ""
}