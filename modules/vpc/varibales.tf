variable "cidr_block" {
  default = "10.0.0.0/16"

}

variable "public_cidr1" {
  default = "10.0.1.0/24"
  
}

variable "public_cidr2" {
  default = "10.0.2.0/24"
  
}

variable "private_cidr1" {
  default = "10.0.3.0/24"
  
}

variable "private_cidr2" {
  default = "10.0.4.0/24"
  
}
variable "availability_zone1" {

  default = "ap-east-1a"
  
}
variable "availability_zone2" {

  default = "ap-east-1b"
  
}

