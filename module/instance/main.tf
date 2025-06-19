resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    instance_tenancy = "default"
    tags = {
      Name = "first-vpc"
    }

  
}


#creating of publicsubnet1

resource "aws_subnet" "public1" {
    vpc_id = aws_vpc.first_vpc.id
    cidr_block = var.public1_cidr
    availability_zone = var.availability1_zone
    
    tags = {
        Name = "public-1"
    }
  
}
#creating of publicsubnet2

resource "aws_subnet" "public2" {
    vpc_id = aws_vpc.first_vpc.id
    cidr_block = var.public2_cidr
    availability_zone = var.availability2_zone
    tags = {
      Name = "public-2"
    }
  
}
##creating of pivatesubnet1

resource "aws_subnet" "private1" {
    vpc_id = aws_vpc.first_vpc.id
    cidr_block = var.private1_cidr
    availability_zone = var.availability1_zone
    tags = {
        Name = "private-1"
    }
  
}

##creating of pivatesubnet2

resource "aws_subnet" "private2" {
    vpc_id = aws_vpc.first_vpc.id
    cidr_block = var.private2_cidr
    availability_zone = var.availability2_zone
    tags = {
      Name = "private2"
    }
  
}

##creating of pivatesubnet3

resource "aws_subnet" "private3" {
    vpc_id = aws_vpc.first_vpc.id
    cidr_block = var.private3_cidr
    availability_zone = var.availability1_zone
    tags = {
      Name = "private3"
    }
  
}
##creating of pivatesubnet4

resource "aws_subnet" "private4" {
    vpc_id = aws_vpc.first_vpc.id
    cidr_block = var.private4_cidr
    availability_zone = var.availability2_zone
    tags = {
      Name = "private4"
    }
  
}

# creating of internetgateway

resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.first_vpc.id
    tags = {
      Name ="internet-gateway"
    }
  
}

# create of elasticip
resource "aws_eip" "eip" {
  
  

  tags = {
    Name = "my-elastic-ip"
  }
}


#create of natgateway

resource "aws_nat_gateway" "nat" {
    subnet_id =   aws_subnet.public1.id
    tags = {
      Name = "nat1"
    }
    connectivity_type =  "public"
    allocation_id = aws_eip.eip.id
    
}

#create of routetable


resource "aws_route_table" "route1" {
    vpc_id = aws_vpc.first_vpc.id
    tags = {
        Name = "myroute1"
    } 
  
}

#attach of internetgateway to routetable

resource "aws_route" "access_internet" {
    route_table_id = aws_route_table.route1.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  
}

#attach of subnets to routetable

resource "aws_route_table_association" "assoc_public1" {
  route_table_id = aws_route_table.route1.id
  subnet_id      = aws_subnet.public1.id
}

resource "aws_route_table_association" "assoc_public2" {
  route_table_id = aws_route_table.route1.id
  subnet_id      = aws_subnet.public2.id
}


#security group creating


resource "aws_security_group" "sg1" {
  name        = "example-sg"
  description = "Example security group"
  vpc_id      = aws_vpc.first_vpc.id

  # Allow HTTP traffic
  ingress {
    description      = "Allow HTTP traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # Allow HTTPS traffic
  ingress {
    description      = "Allow HTTPS traffic"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # Allow SSH traffic
  ingress {
    description      = "Allow SSH traffic"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.trusted_ip] 
  }

  # Allow all outbound traffic (default egress)
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # Allows all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-sg"
  }
}
