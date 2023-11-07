variable "linux-key-name-pri" {
  description = "Name of Key Pair for Private EC2 instance"
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

variable "linux-keyfilename-pri" {
  description = "Name of Key Pair file for Private EC2 Instance"
  type        = string
}

variable "pri_linux_instance_name" {
  description = "Value of the Name tag for the Private EC2 Linux instance"
  type        = string
}

variable "amitype-Linux" {
    description = "AMI Type for Linux"
    type = string
    default = "ami-053b0d53c279acc90"
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
