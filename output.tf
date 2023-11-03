 output "pri_sg_id" {
  description = "ID of the Private Subnet Security Group"
  value = module.vpc.pri_sg_id
}

output "pri-subnet-id" {
  description = "ID for Private Subnet"
  value = module.vpc.pri-subnet-id
}

 output "pub_sg_id" {
  description = "ID of the Public Subnet Security Group"
  value = module.vpc.pub_sg_id
}

output "pub-subnet-id" {
  description = "ID for Public Subnet"
  value = module.vpc.pub-subnet-id
}



