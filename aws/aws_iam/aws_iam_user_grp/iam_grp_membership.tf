terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.23.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_iam_group_membership" "team" {
  name = "team-one"

  users = [
    aws_iam_user.user_one.name,
    aws_iam_user.user_two.name,
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "group_name"
}

resource "aws_iam_user" "user_one" {
  name = "user-one"
}

resource "aws_iam_user" "user_two" {
  name = "user-two"
}
