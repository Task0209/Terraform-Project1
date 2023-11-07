
variable "linux-key-name-pub" {
  description = "Name of Key Pair for Public EC2 instance"
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


variable "linux-keyfilename-pub" {
  description = "Name of Key Pair file for Public EC2 Instance"
  type        = string
}


variable "pub_linux_instance_name" {
  description = "Value of the Name tag for the Public EC2 Linux instance"
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
    default = "t2.micro"
}

 variable "pub_sg_id" {
  description = "ID of the Public Subnet Security Group"
  type = string
}

variable "pub-subnet-id" {
  description = "ID for Public Subnet"
  type = string
}
