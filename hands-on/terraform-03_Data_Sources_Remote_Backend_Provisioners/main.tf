terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.40.0"
    }
  }
  backend "s3" {
    bucket = "tf-remote-s3-01"
    key = "./s3-backend/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf-s3-app-lock-01"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}


