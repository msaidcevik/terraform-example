terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.23.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tf-s3" {  
  for_each = toset(var.users)
  bucket   = "${var.s3_bucket_name}-${each.value}"
}
