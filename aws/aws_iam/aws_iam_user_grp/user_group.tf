provider "aws" {
  region  = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.23.0"
    }
  }
}

resource "aws_iam_user" "myfirst_resource" {
  name = "user1_name"
  tags = {
    tag-key = "Said"
  }
}

resource "aws_iam_group" "dev_grp" {
  name = "group1"
}