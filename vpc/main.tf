# VPC contains both Public & Private Subnet
resource "aws_vpc" "alpha_vpc" {
  cidr_block           = var.vpc_cidr
  tags = {
    Name = "${var.vpc_name}"
  }
}

# Creating Subnets
# Public Subnet
resource "aws_subnet" "public_subnet_alpha_impex" {
  vpc_id                  = aws_vpc.alpha_vpc.id
  cidr_block              = var.public_subnet_impex_cidr
  availability_zone       = var.azs
   tags = {
    Name = "${var.public_subnet_name}"
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet_alpha_impex" {
  vpc_id                  = aws_vpc.alpha_vpc.id
  cidr_block              = var.private_subnet_impex_cidr
  availability_zone       = var.azs
   tags = {
    Name = "${var.private_subnet_name}"
  }
}

# Creating Gateways

#Internet gateway
resource "aws_internet_gateway" "ig_impex_book" {
  vpc_id = aws_vpc.alpha_vpc.id
   tags = {
    Name = "${var.igw_name}"
  }
}

#NAT Gateway
resource "aws_nat_gateway" "ng_impex_book" {
  subnet_id     = aws_subnet.public_subnet_alpha_impex.id
  allocation_id = aws_eip.eip_impex_book.id
  tags = {
    Name        = "${var.ngw_name}"
  }
}

# Elastic-IP (eip) for nat gateways
resource "aws_eip" "eip_impex_book" {
  domain   = var.domains
  depends_on = [aws_internet_gateway.ig_impex_book]
}


# Routing tables for Public Subnet
resource "aws_route_table" "public_alpha_rt" {
  vpc_id = aws_vpc.alpha_vpc.id
   route {
    cidr_block = var.des_cidr
    gateway_id = aws_internet_gateway.ig_impex_book.id
  }
   tags = {
    Name = "${var.pub_rt_name}"
  }
}

# Routing tables for Private Subnet
resource "aws_route_table" "private_alpha_rt" {
  vpc_id = aws_vpc.alpha_vpc.id
   route {
    cidr_block = var.des_cidr
    gateway_id = aws_nat_gateway.ng_impex_book.id
  }
   tags = {
    Name = "${var.pri_rt_name}"
  }
}


# Route table associations for Public subnet
resource "aws_route_table_association" "public_rta_apha_impex" {
  subnet_id      = aws_subnet.public_subnet_alpha_impex.id
  route_table_id = aws_route_table.public_alpha_rt.id
}

# Route table associations for Private subnet
resource "aws_route_table_association" "private_rta_apha_impex" {
  subnet_id      = aws_subnet.private_subnet_alpha_impex.id
  route_table_id = aws_route_table.private_alpha_rt.id
}


# Create security groups to allow specific traffic for public subnet

resource "aws_security_group" "impex_public_sg" {
  name   = "${var.pub_sg_name}"
  description = "Allow traffic to the VPC for Public Subnet"
  vpc_id = aws_vpc.alpha_vpc.id


  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.des_cidr]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.des_cidr]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.des_cidr]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [var.des_cidr]
  }

  tags = {
    Name        = "${var.pub_sg_name}"
  }
}

# Create security groups to allow specific traffic for private subnet

resource "aws_security_group" "impex_private_sg" {
  name   = "${var.pri_sg_name}"
  description = "Allow traffic to the VPC for Private Subnet"
  vpc_id = aws_vpc.alpha_vpc.id


  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_impex_cidr]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_impex_cidr]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_impex_cidr]
  }

   ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_impex_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [var.des_cidr]
  }

  tags = {
    Name        = "${var.pri_sg_name}"
  }
}