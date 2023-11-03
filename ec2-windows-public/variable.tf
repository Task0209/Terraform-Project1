
variable "pub_windows_instance_name" {
  description = "Value of the Name tag for the EC2 Windows instance"
  type        = string
}

variable "amitype-Windows" {
    description = "AMI Type for Windows"
    type = string
    default = "ami-005f8adf84f8c5057"
}

variable "instancetype" {
    description = "EC2 instance Type"
    type = string
    default = "t3.micro"
}

 variable "pub_sg_id" {
  description = "ID of the Public Subnet Security Group"
  type = string
  default = ""
}

variable "pub-subnet-id" {
  description = "ID for Public Subnet"
  type = string
  default = ""
}

variable "windows-key-name-pub" {
  description = "Name of Key Pair for Public EC2 instance"
  type        = string
}

variable "windows-keyfilename-pub" {
  description = "Name of Key Pair file for Public EC2 Instance"
  type        = string
}

variable "alg" {
    description = "Method of an algorithm"
    type = string
    default = "RSA"
}

variable "bits" {
    description = "RSA Bits"
    type = number
    default = 4096
}

  variable "domains" {
     type = string
    description = "VPC for Elastic IP"
    default = "vpc"
 }

