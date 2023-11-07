
variable "windows_instance_name" {
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

 variable "pri_sg_id" {
  description = "ID of the Private Subnet Security Group"
  type = string
}

variable "pri-subnet-id" {
  description = "ID for Private Subnet"
  type = string
}
