 output "pri_sg_id" {
  description = "ID of the Private Subnet Security Group"
  value = module.vpc.pri_sg_id
}

output "pri-subnet-id" {
  description = "ID for Private Subnet"
  value = module.vpc.pri-subnet-id
}



