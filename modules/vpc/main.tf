resource "aws_vpc" "vpc" {

    cidr_block = var.cidr_block
    enable_dns_hostnames = true
    enable_dns_support = true
    instance_tenancy = "default"
    tags = {
      Name  = "first-vpc"
    }

  
}

resource "aws_subnet" "public1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_cidr1
    availability_zone = var.availability_zone1
    tags = {
      
      Name = "public1"
    }
  
}

resource "aws_subnet" "private1" {
   vpc_id = aws_vpc.vpc.id
   cidr_block = var.private_cidr1
   availability_zone = var.availability_zone1
   tags = {
     Name = "private1"
   }
  
}

resource "aws_subnet" "public2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_cidr2
    availability_zone = var.availability_zone2
    tags = {
      
      Name = "public2"
    }
  
}

resource "aws_subnet" "private2" {
   vpc_id = aws_vpc.vpc.id
   cidr_block = var.private_cidr2
   availability_zone = var.availability_zone2
   tags = {
     Name = "private2"
   }
  
}