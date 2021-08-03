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

#Zone: A, Env: PRO, Type: PUBLIC, Code: 1
module "aws_sn_za_pro_pub_1" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_za_pro_pub_1["cidr"]
  name   = var.aws_sn_za_pro_pub_1["name"]
  az     = var.aws_sn_za_pro_pub_1["az"]
  public = var.aws_sn_za_pro_pub_1["public"]
}

#Zone: A, Env: PRO, Type: PRIVATE, Code: 3
module "aws_sn_za_pro_pri_3" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_za_pro_pri_3["cidr"]
  name   = var.aws_sn_za_pro_pri_3["name"]
  az     = var.aws_sn_za_pro_pri_3["az"]
  public = var.aws_sn_za_pro_pri_3["public"]
}

#Zone: B, Env: PRO, Type: PUBLIC, Code: 5
module "aws_sn_zb_pro_pub_5" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_zb_pro_pub_5["cidr"]
  name   = var.aws_sn_zb_pro_pub_5["name"]
  az     = var.aws_sn_zb_pro_pub_5["az"]
  public = var.aws_sn_zb_pro_pub_5["public"]
}

#Zone: B, Env: PRO, Type: PRIVATE, Code: 7
module "aws_sn_zb_pro_pri_7" {
  source = "./modules/aws/network/subnet"
  vpc_id = module.aws_network_vpc.id
  cidr   = var.aws_sn_zb_pro_pri_7["cidr"]
  name   = var.aws_sn_zb_pro_pri_7["name"]
  az     = var.aws_sn_zb_pro_pri_7["az"]
  public = var.aws_sn_zb_pro_pri_7["public"]
}

#----------------------
# SUBNET for RDS
#----------------------

#----------------------
# PRO
#----------------------
module "aws_rds_sn_pri_pro_01" {
  source      = "./modules/aws/rds/subnet"
  name        = var.aws_rds_sn_pri_pro_01["name"]
  description = var.aws_rds_sn_pri_pro_01["description"]

  # Add 2 PRIVATE Subnets from two availability zones
  subnet_ids = [module.aws_sn_za_pro_pri_3.id, module.aws_sn_zb_pro_pri_7.id]
  # Add 1 PRIVATE Subnets from two availability zones
  #subnet_ids  = [module.aws_sn_za_pro_pri_3.id]
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
