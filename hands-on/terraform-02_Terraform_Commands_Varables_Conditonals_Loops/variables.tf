variable "ec2_name" {
  default = "said-ec2"
}

variable "ec2_type" {
  default = "t2.micro"
}

variable "ec2_ami" {
  default = "ami-09d3b3274b6c5d4aa"
}
variable "s3_bucket_name" {}

variable "num_of_buckets" {
  default = 2
}

variable "users" {
  default = ["santino", "michael", "fredo"]
}