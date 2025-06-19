module "vpc" {

    source = "./module/instance"
   
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    instance_tenancy = "default"
    tags = {
      Name = "first-vpc"
    }

}




