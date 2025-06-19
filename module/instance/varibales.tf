variable "vpc_cidr" {
    description = "vpc block id"
    default = "10.0.0.0/16"

}

variable "public1_cidr" {
    description = "public subnet1"
    default = "10.0.1.0/24"
}

variable "public2_cidr" {
    description = "public subnet2"
    default = "10.0.2.0/24"
  
}

variable "private1_cidr" {
    description = "private1-subnet"
    default = "10.0.3.0/24"
  
}


variable "private2_cidr" {
    description = "private1-subnet"
    default = "10.0.4.0/24"
  
}

variable "private3_cidr" {
    description = "private1-subnet"
    default = "10.0.5.0/24"
  
}

variable "private4_cidr" {
    description = "prviate4-subnet"
    default = "10.0.6.0/24"
  
}






variable "availability1_zone" {
    description = "first avalibality zone"
    default = "ap-southeast-1a"
  
}

variable "availability2_zone" {
    description = "second avalibality zone"
    default = "ap-southeast-1b"
  
}

variable "trusted_ip" {
  description = "Your trusted public IP for SSH access"
  type        = string
  default     = "YOUR_PUBLIC_IP/32"  # Replace with your actual public IP
}
