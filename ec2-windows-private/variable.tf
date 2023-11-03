
variable "pri_windows_instance_name" {
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
    default = "t2.micro"
}

 variable "pri_sg_id" {
  description = "ID of the Private Subnet Security Group"
  type = string
  default = ""
}

variable "pri-subnet-id" {
  description = "ID for Private Subnet"
  type = string
  default = ""
}

variable "windows-key-name-pri" {
  description = "Name of Key Pair for Private EC2 instance"
  type        = string
}

variable "windows-keyfilename-pri" {
  description = "Name of Key Pair file for Private EC2 Instance"
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
