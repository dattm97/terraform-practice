# Network configuration

#-----------------------------------------
# VPC
#-----------------------------------------

#Create a VPC
module "aws_network_vpc" {
  source           = "./modules/aws/network/vpc"
  aws_vpc_block    = var.aws_vpc_block
  aws_vpc_tag_name = var.aws_vpc_tag_name
}

#----------------------
# AWS Internet Gateway
#----------------------

#Create an Internet GW
module "aws_internet_gw" {
  source = "./modules/aws/network/internet_gateway"
  vpc_id = module.aws_network_vpc.id
  name   = var.aws_internet_gw_name
}


#-----------------------------------------
# Zones
#-----------------------------------------

#Zone: A, Env: PRO, Type: PUBLIC, Code: 32
module "aws_sn_za_pro_pub_32" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_za_pro_pub_32["cidr"]
  name   = var.aws_sn_za_pro_pub_32["name"]
  az     = var.aws_sn_za_pro_pub_32["az"]
  public = var.aws_sn_za_pro_pub_32["public"]
}

#Zone: A, Env: PRO, Type: PRIVATE, Code: 34
module "aws_sn_za_pro_pri_34" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_za_pro_pri_34["cidr"]
  name   = var.aws_sn_za_pro_pri_34["name"]
  az     = var.aws_sn_za_pro_pri_34["az"]
  public = var.aws_sn_za_pro_pri_34["public"]
}

#Zone: B, Env: PRO, Type: PUBLIC, Code: 36
module "aws_sn_zb_pro_pub_36" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_zb_pro_pub_36["cidr"]
  name   = var.aws_sn_zb_pro_pub_36["name"]
  az     = var.aws_sn_zb_pro_pub_36["az"]
  public = var.aws_sn_zb_pro_pub_36["public"]
}

#Zone: B, Env: PRO, Type: PRIVATE, Code: 38
module "aws_sn_zb_pro_pri_38" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_zb_pro_pri_38["cidr"]
  name   = var.aws_sn_zb_pro_pri_38["name"]
  az     = var.aws_sn_zb_pro_pri_38["az"]
  public = var.aws_sn_zb_pro_pri_38["public"]
}

#----------------------
# SUBNET for RDS
#----------------------

#----------------------
# PRO
#----------------------
module "aws_rds_sn_pub_pro_01" {
  source      = "./modules/aws/rds/subnet"
  name        = var.aws_rds_sn_pub_pro_01["name"]
  description = var.aws_rds_sn_pub_pro_01["description"]

  # Add 2 PRIVATE Subnets from two availability zones
  subnet_ids = [module.aws_sn_za_pro_pub_32.id, module.aws_sn_zb_pro_pub_36.id]
  # Add 1 PRIVATE Subnets from two availability zones
  #subnet_ids  = [module.aws_sn_za_pro_pub_32.id]
}



# # Subnet configuration
# resource "aws_subnet" "http" {
#   vpc_id     = aws_vpc.terraform.id
#   cidr_block = var.network_http["cidr"]
#   tags = {
#     Name = "subnet-http"
#   }
#   depends_on = [aws_internet_gateway.gw]
# }

# # External gateway configuration
# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.terraform.id
#   tags = {
#     Name = "internet-gateway"
#   }
# }
