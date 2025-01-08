# Terraform Settings Block
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.31"
     }
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.9.0"
    }
    http = {
      source = "hashicorp/http"
      version = ">= 3.3.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.20"
    }      
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {}     
}

# Terraform AWS Provider Block
provider "aws" {
  region = var.aws_region
}

# Terraform HTTP Provider Block
provider "http" {
  # Configuration options
}