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

resource "aws_vpc" "module_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = { Name =  "terraform-vpc-${var.environment}"}   
}

resource "aws_subnet" "public_subnet" {
  cidr_block = var.public_subnet_cidr
  vpc_id = aws_vpc.module_vpc.id  
  availability_zone = "us-east-1a"
  tags = { Name = "tf-public-subnet-${var.environment}"}
}

resource "aws_subnet" "private_subnet" {
  cidr_block = var.private_subnet_cidr
  vpc_id = aws_vpc.module_vpc.id
  availability_zone = "us-east-1b"
  tags = { Name = "tf-private-subnet-${var.environment}"}
}

resource "aws_internet_gateway" "module_igw" {
  vpc_id = aws_vpc.module_vpc.id
  tags = { Name = "internet_gateway"}
}


resource "aws_route_table" "module_public_rt" {
  vpc_id = aws_vpc.module_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.module_igw.id
  }
  tags = { Name = "Public route table"}
}

resource "aws_route_table" "module_private_rt" {
  vpc_id = aws_vpc.module_vpc.id
  tags = { Name = "Private route table" }
}

resource "aws_route_table_association" "public_rt_associ" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.module_public_rt.id  
}

resource "aws_route_table_association" "private_rt_associ" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.module_private_rt.id
}
