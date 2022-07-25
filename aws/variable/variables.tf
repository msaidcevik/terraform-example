variable "ec2_ami" {
  default = "ami-0cff7528ff583bf9a"
}

variable "ec2_type" {
  default = "t2.micro"
}

variable "ec2_name" {
  default = "said-ec2"
}

variable "key_name" {
  default = "firstkey"
}
variable "s3_bucket_name" {
  default = "said-s3-bucket"
}
