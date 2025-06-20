module "vpc" {
  source             = "./modules/vpc"
  cidr_block         = var.cidr_block
  public_cidr1       = var.public_cidr1
  public_cidr2       = var.public_cidr2
  private_cidr1      = var.private_cidr1
  private_cidr2      = var.private_cidr2
  availability_zone1 = var.availability_zone1
  availability_zone2 = var.availability_zone2
}

module "ig" {
    source = "./modules/ig"
    vpc_id = var.vpc_id
  
}

module "natgateway" {
    source = "./modules/nategateway"
    subnet_id =   var.public1_subnet

    tags = {
      Name = "nat"
    }
    connectivity_type =  "public"
    allocation_id = aws_eip.eip.id
}

resource "aws_eip" "eip" {

  tags = {
    Name = "my-elastic-ip"
  }
}


