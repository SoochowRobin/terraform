terraform {
    required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "~> 3.0"
      }
    }
}

# configure the AWS provider
provider "aws" {
    region = "us-east-1"
}

# create a VPC
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
}


resource "aws_instance" "foobar" {
    # ami = "ami-0184e674549ab8432"  # copy it from aws interface
    # when you want to change ami you just change it in code
    ami = "ami-0f095f89ae15be883"
    instance_type = "t2.medium"

    tags = {
        Name = "HelloRobin"
        # maybe we want to add another tag

    }
}

 
