output "vpc_name" {
  description = "Name of the VPC"
  value = aws_vpc.alpha_vpc.tags
}

output "public_subnet_name" {
  description = "Name of the  Public SUBNET"
  value = aws_subnet.public_subnet_alpha_impex.tags
}

output "private_subnet_name" {
  description = "Name of the Private SUBNET"
  value = aws_subnet.private_subnet_alpha_impex.tags
}

output "igw_name" {
  description = "Name of the Internet Gateway"
  value = aws_internet_gateway.ig_impex_book.tags
}


output "pub_rt_name" {
  description = "Name of the Public Route table"
  value = aws_route_table.public_alpha_rt.tags
}

output "pri_rt_name" {
  description = "Name of the Private Route table"
  value = aws_route_table.private_alpha_rt.tags
}


 output "pub_sg_name" {
  description = "Name of the Public Subnet Security Group"
  value = aws_security_group.impex_public_sg.tags
}

 output "pri_sg_name" {
  description = "Name of the Private Subnet Security Group"
  value = aws_security_group.impex_private_sg.tags
}

 output "pub_sg_id" {
  description = "ID of the Public Subnet Security Group"
  value = aws_security_group.impex_public_sg.id
}

 output "pri_sg_id" {
  description = "ID of the Private Subnet Security Group"
  value = aws_security_group.impex_private_sg.id
}

output "pub-subnet-id" {
  description = "ID for Public Subnet"
  value = aws_subnet.public_subnet_alpha_impex.id
}

output "pri-subnet-id" {
  description = "ID for Private Subnet"
  value = aws_subnet.private_subnet_alpha_impex.id
}

