provider "aws" {
  region  = var.region
}


module "vpc" {
  source          = "./vpc/"
  vpc_name = "${var.env}-${var.region}-${var.service}-vpc-${var.ver}"
  public_subnet_name = "${var.env}-${var.region}-${var.service}-public-subnet-${var.ver}"
  private_subnet_name = "${var.env}-${var.region}-${var.service}-private-subnet-${var.ver}" 
  igw_name = "${var.env}-${var.region}-${var.service}-igw-${var.ver}"
  ngw_name = "${var.env}-${var.region}-${var.service}-ngw-${var.ver}"
  pub_rt_name= "${var.env}-${var.region}-${var.service}-public-route-table-${var.ver}"
  pri_rt_name = "${var.env}-${var.region}-${var.service}-private-route-table-${var.ver}"
  pub_sg_name = "${var.env}-${var.region}-${var.service}-public-sg-${var.ver}"
  pri_sg_name = "${var.env}-${var.region}-${var.service}-private-sg-${var.ver}"
  des_cidr = var.des_cidr
}

module "ec2-linux" {
  source = "./ec2-linux/"
  count = "${var.linux_instance_count}"
  linux_instance_name = "${var.env}-${var.region}-${var.service}-linux-instance-${count.index}-${var.ver}"
  linux-key-name = "${var.env}-${var.region}-${var.service}-alphalinux-impexkey-${count.index}-${var.ver}"
  linux-keyfilename = "${var.env}-${var.region}-${var.service}-alphalinux-impexkeyfile-${count.index}-${var.ver}"
  pri_sg_id = module.vpc.pri_sg_id
  pri-subnet-id = module.vpc.pri-subnet-id
}

module "ec2-windows" {
  source = "./ec2-windows/"
  count = "${var.windows_instance_count}"
  windows_instance_name = "${var.env}-${var.region}-${var.service}-windows-instance-${count.index}${var.ver}"
  pri_sg_id = module.vpc.pri_sg_id
  pri-subnet-id = module.vpc.pri-subnet-id
}


