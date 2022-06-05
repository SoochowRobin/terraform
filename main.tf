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
# some of vpc would export 
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "robin vpc"
    }
}


# define a subnet and it get vpc_id from vpc export

resource "aws_subnet" "robinSubnet" {
    # how to get a export from one resource, resourcetpye.name.param
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "robin subnet"
    }
}



resource "aws_instance" "foobar" {
    # ami = "ami-0184e674549ab8432"  # copy it from aws interface
    # when you want to change ami you just change it in code
    ami = "ami-0f095f89ae15be883"
    instance_type = "t2.medium"

    # attach subnet to this instance 
    subnet_id = aws_subnet.robinSubnet.id

    tags = {
        Name = "HelloRobin"
        # maybe we want to add another tag

    }
}

 
