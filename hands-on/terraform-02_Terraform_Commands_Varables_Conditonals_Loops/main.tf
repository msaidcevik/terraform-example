terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.37.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  mytag = "said-local-name"
}

resource "aws_instance" "tf-ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = "firstkey"
  tags = {
    Name = "${local.mytag}-come from locals"
  }
}

resource "aws_s3_bucket" "tf-s3" {
  bucket = "${var.s3_bucket_name}-${count.index}"
    # count = var.num_of_buckets
  count = var.num_of_buckets != 0 ? var.num_of_buckets : 3
  tags = {
    Name = "${local.mytag}-come from locals"
  }
}



output "tf_example_public_ip" {
  value = aws_instance.tf-ec2.public_ip
}

#output "tf_example_s3_meta" {
#  value = aws_s3_bucket.tf-s3.region
#}

output "tf_example_private_ip" {
  value = aws_instance.tf-ec2.private_ip
}