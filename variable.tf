variable region {
  type = string
  description = "Aws Region"
}

variable env {
  type = string
  description = "Environment"
}

variable service {
  type = string
  description = "Service"
}

variable ver {
  type = string
  description = "Version"
}

variable "linux-key-name-pri" {
  description = "Name of Key Pair for Private EC2 instance"
  type        = string
  default = ""
}

variable "linux-key-name-pub" {
  description = "Name of Key Pair for Public EC2 instance"
  type        = string
  default = ""
}

variable "linux-keyfilename-pri" {
  description = "Name of Key Pair file for Private EC2 Instance"
  type        = string
  default = ""
}

variable "linux-keyfilename-pub" {
  description = "Name of Key Pair file for Public EC2 Instance"
  type        = string
  default = ""
}

variable "vpc_name" {
  type = string
  description = "Name of the Alpha VPC"
  default = ""
}


variable "public_subnet_name" {
  type = string
  description = "Name of the Public SUBNET"
  default = ""
}

variable "private_subnet_name" {
  type = string
  description = "Name of the Private SUBNET"
  default = ""
}

variable "igw_name" {
  type = string
  description = "Name of the Internet Gateway"
  default = ""
}

variable "ngw_name" {
  type = string
  description = "Name of the NAT Gateway"
  default = ""
}

variable "des_cidr" {
     type = string
    description = "Destination address for Gateway"
    default = " "
 }

 variable "pub_sg_name" {
  type = string
  description = "Name of the Security Group for Public subnet"
  default = " "
}

variable "pri_sg_name" {
  type = string
  description = "Name of the Security Group for Private subnet"
  default = " "
}

variable "pub_rt_name" {
  type = string
  description = "Name of the Route table for Public subnet"
  default =""
}

variable "pri_rt_name" {
  type = string
  description = "Name of the Route table for Private subnet"
  default =""
}

 variable "pri_sg_id" {
  description = "ID of the Private Subnet Security Group"
  type = string
  default =""
}

variable "pri-subnet-id" {
  description = "ID for Private Subnet"
  type = string
  default =""
}

 variable "pub_sg_id" {
  description = "ID of the Public Subnet Security Group"
  type = string
  default =""
}

variable "pub-subnet-id" {
  description = "ID for Public Subnet"
  type = string
  default =""
}


variable "pub_linux_instance_name" {
  description = "Value of the Name tag for the Public EC2 Linux instance"
  type        = string
  default =""
}

variable "pri_linux_instance_name" {
  description = "Value of the Name tag for the Private EC2 Linux instance"
  type        = string
  default =""
}

variable "windows_instance_name" {
  description = "Value of the Name tag for the EC2 Windows instance"
  type = string
  default =""
}

variable "pri_linux_instance_count" {
  description = "Number of Private EC2 Ubuntu Instances"
  type = number
  default = 1
}

variable "windows_instance_count" {
  description = "Number of EC2 Windows 2022 Instances"
  type = number
  default = 1
}

