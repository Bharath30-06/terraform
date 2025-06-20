resource "aws_nat_gateway" "natgateway" {

    subnet_id  = module.aws.public1_subnet

    tags = {
      Name = "nat1"
    }
    connectivity_type =  "public"
    allocation_id = aws_eip.eip.id
  
}

resource "aws_eip" "eip" {
  
  

  tags = {
    Name = "my-elastic-ip"
  }
}
