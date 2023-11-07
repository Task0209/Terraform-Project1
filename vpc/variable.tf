variable "vpc_name" {
  type = string
  description = "Name of the Alpha VPC"
}

  variable "domains" {
     type = string
    description = "VPC for Elastic IP"
    default = "vpc"
 }

variable "azs" {
  type = string
  description = "Availability Zone"
  default = "us-east-1c"
}

variable "public_subnet_name" {
  type = string
  description = "Name of the Public SUBNET"
}

variable "private_subnet_name" {
  type = string
  description = "Name of the Private SUBNET"
}

variable "igw_name" {
  type = string
  description = "Name of the Internet Gateway"
}

variable "ngw_name" {
  type = string
  description = "Name of the NAT Gateway"
}

variable "pub_rt_name" {
  type = string
  description = "Name of the Route table for Public subnet"
}

variable "pri_rt_name" {
  type = string
  description = "Name of the Route table for Private subnet"
}


variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "CIDR block of the Alpha VPC"
}

variable "public_subnet_impex_cidr" {
  default     = "10.0.0.0/24"
  description = "CIDR block for Public subnet"
}

variable "private_subnet_impex_cidr" {
  default     = "10.0.1.0/24"
  description = "CIDR block for Private subnet"
}

variable "hostnames_ec2" {
  default = "true"
  description = "Enable the Hostname for EC2"
}


 variable "des_cidr" {
     type = string
    description = "Destination address for Gateway"
 }

 variable "pub_sg_name" {
  type = string
  description = "Name of the Security Group for Public subnet"
}

 variable "pri_sg_name" {
  type = string
  description = "Name of the Security Group for Private subnet"
}

