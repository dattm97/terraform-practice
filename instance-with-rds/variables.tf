
#-------------------------
# Word Press Server
#-------------------------

variable "aws_ec2_pro_pub_wp_01" {
  description = "Server for Word Press, Env: PRO"
  type        = map(any)
}

variable "aws_sg_ec2_pro_pub_wp_01" {
  description = "Security group for Word Press Server, Env: PRO "
  type        = map(any)
}

variable "aws_sr_ec2_pro_pub_wp_01_internet_to_80" {
  description = "Access from Internet to port 80"
  type        = map(any)
}

variable "aws_sr_ec2_pro_pub_wp_01_internet_to_443" {
  description = "Access from Internet to port 443"
  type        = map(any)
}

#-----------------------------------------
# VPC
#-----------------------------------------

variable "aws_vpc_block" {
  description = "Private IP block for the VPC in CIDR format"
}

variable "aws_vpc_tag_name" {
  description = "Name of the VPC"
}

#----------------------
# AWS Internet Gateway
#----------------------

variable "aws_internet_gw_name" {
  description = "Internet GW name"
}


# ---------------------------------------------------
# SUBNETS
# ---------------------------------------------------

#Zone: A, Env: PRO, Type: PUBLIC, Code: 32
variable "aws_sn_za_pro_pub_32" {
  description = "Zone: A, Env: PRO, Type: PUBLIC, Code: 32"
  type        = map(any)
}
#Zone: A, Env: PRO, Type: PRIVATE, Code: 34
variable "aws_sn_za_pro_pri_34" {
  description = "Zone: A, Env: PRO, Type: PRIVATE, Code: 34"
  type        = map(any)
}

#Zone: B, Env: PRO, Type: PUBLIC, Code: 36
variable "aws_sn_zb_pro_pub_36" {
  description = "Zone: B, Env: PRO, Type: PUBLIC, Code: 36"
  type        = map(any)
}
#Zone: B, Env: PRO, Type: PRIVATE, Code: 38
variable "aws_sn_zb_pro_pri_38" {
  description = "Zone: B, Env: PRO, Type: PRIVATE, Code: 38"
  type        = map(any)
}

#----------------------
# SUBNET for RDS
#----------------------

#----------------------
# PRO
#----------------------

variable "aws_rds_sn_pub_pro_01" {
  description = "RDS Subnet 01, Pub, Env: PRO"
  type        = map(any)
}


#-----------------------------------------
# ROUTING
#-----------------------------------------

variable "aws_main_route_table_name" {
  description = "Main VPC route table"
}

variable "aws_internet_route" {
  description = "Internet route"
  type        = map(any)
}

variable "aws_private_route_table_za_name" {
  description = "VPC route table for private SN in zone A"
}

variable "aws_private_route_table_zb_name" {
  description = "VPC route table for private SN in zone B"
}


#----------------------
# ROUTE 53 (DNS)
#----------------------

#------------------------
# Public: Zone to be used
# Outside the VPC
#------------------------

variable "aws_route53_delegation_set_reference_name" {
  description = "Name of Reusable Delegation Sets for Route 53"
}

variable "aws_route53_public" {
  description = "Route 53 for public VPC DNS"
  type        = map(any)
} # public


#----------------------
# RDS MariaDB
#----------------------

variable "aws_sg_rds_mariadb_pro_pub_01" {
  description = "Security group for RDS Postgresql"
  type        = map(any)
}
variable "aws_sr_rds_mariadb_pro_pub_01_instances_to_db_port" {
  description = "Access from Instances to DB port"
  type        = map(any)
}
variable "aws_rds_mariadb_pro_pub_01" {
  description = "RDS PRO Maria DB 01"
  type        = map(any)
}


#-------------------------
# SECURITY - Default group
#-------------------------

variable "aws_sg_ec2_default" {
  description = "Default Security Group for all instances, Env: PRO"
  type        = map(any)
}

variable "aws_sr_ec2_default_internet_to_ssh" {
  description = "Access from Internet IP to SSH port"
  type        = map(any)
}


#-------------------------
# SECURITY - Default group
#-------------------------

variable "aws_sg_rds_mariadb_default" {
  description = "Default Security Group for all Maria DB instances"
  type        = map(any)
}

variable "aws_sr_rds_mariadb_default_internet_to_db_port" {
  description = "Access from Instances to DB port"
  type        = map(any)
}

#-----------------------------------------
# Default provider: AWS
#-----------------------------------------

variable "provider_default_aws_profile" {
  description = "AWS profile name as set in the shared credentials file"
  default     = "none"
}

variable "provider_default_aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "provider_default_aws_account_id" {
  description = "List of allowed, white listed, AWS account IDs"
  default     = []
}

variable "provider_default_aws_shared_credentials_file" {
  description = "This is the path to the shared credentials file"
}

#-----------------------------------------
# Terraform defaults
#-----------------------------------------

# Configures the behavior of Terraform itself
# only allowed configurations within this block are required_version and backend.
# Detail: https://www.terraform.io/docs/configuration/terraform.html
#Specifying a Required Terraform Version
# cannot contain interpolations, see terraform.tf

variable "is_production" {
  description = "The infrastructure is in production?. If true api_termination will be disabled"
  default     = true
}


# variable "instance_name" {
#   type = map(string)
#   default = {
#     name        = "ExampleAppServerInstance"
#     environment = "DEV"
#     elasticIP   = "public-http"
#   }
# }


# variable "awsprops" {
#   type = map(string)
#   default = {
#     region       = "us-west-2"
#     ami          = "ami-083ac7c7ecf9bb9b0"
#     type         = "t2.micro"
#     publicip     = true
#     secgroupname = "IAC-Sec-Group"
#   }
# }

# variable "vpc_cidr" {
#   default = "172.31.0.0/16"
# }

# variable "network_http" {
#   default = {
#     subnet_name = "subnet_http"
#     cidr        = "172.31.1.0/24"
#   }
# }
