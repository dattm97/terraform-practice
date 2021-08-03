# resource "aws_security_group" "app_server_sg" {
#   name        = lookup(var.awsprops, "secgroupname")
#   description = lookup(var.awsprops, "secgroupname")
#   vpc_id      = aws_vpc.terraform.id

#   // To Allow SSH Transport
#   ingress {
#     from_port   = 22
#     protocol    = "tcp"
#     to_port     = 22
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   // To Allow Port 80 Transport
#   ingress {
#     from_port   = 80
#     protocol    = "tcp"
#     to_port     = 80
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   # To Allow Port 443 Transport
#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }


# resource "aws_security_group" "rds" {
#   name        = "main_rds_sg"
#   description = "Allow all inbound traffic"
#   vpc_id      = aws_vpc.terraform.id

#   ingress {
#     from_port   = 0
#     to_port     = 65535
#     protocol    = "TCP"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

#---------------------------------------------
# SECURITY - Default group
# Allows access from Internet to SSH Port
# Ideally it should be a single public IP
# Allows access to Internet from instances
#---------------------------------------------

# Group
module "aws_sg_ec2_default" {
  source             = "./modules/aws/security/group"
  vpc_id             = module.aws_network_vpc.id
  name               = var.aws_sg_ec2_default["sec_name"]
  description        = var.aws_sg_ec2_default["sec_description"]
  allow_all_outbound = var.aws_sg_ec2_default["allow_all_outbound"]
}

# Rules
# Access from My IP to SSH Port
module "aws_sr_ec2_default_internet_to_ssh" {
  source            = "./modules/aws/security/rule/cidr_blocks"
  security_group_id = module.aws_sg_ec2_default.id
  type              = var.aws_sr_ec2_default_internet_to_ssh["type"]
  from_port         = var.aws_sr_ec2_default_internet_to_ssh["from_port"]
  to_port           = var.aws_sr_ec2_default_internet_to_ssh["to_port"]
  protocol          = var.aws_sr_ec2_default_internet_to_ssh["protocol"]
  cidr_blocks       = [format("%s/%s", data.external.whatismyip.result["internet_ip"], 32)]
  #sec_rule_ec2_default_internet_to_ssh["cidr_blocks"]
  description = var.aws_sr_ec2_default_internet_to_ssh["description"]
}


#---------------------------------------------
# SECURITY - Default group MariaDB RDS
# Allows access from Internet to DB Port
# Ideally it should be a single public IP
#---------------------------------------------

# Group
module "aws_sg_rds_mariadb_default" {
  source             = "./modules/aws/security/group"
  vpc_id             = module.aws_network_vpc.id
  name               = var.aws_sg_rds_mariadb_default["sec_name"]
  description        = var.aws_sg_rds_mariadb_default["sec_description"]
  allow_all_outbound = var.aws_sg_rds_mariadb_default["allow_all_outbound"]
}

# Rules
# Access from My IP to DB Port
module "aws_sr_rds_mariadb_default_internet_to_db_port" {
  source            = "./modules/aws/security/rule/cidr_blocks"
  security_group_id = module.aws_sg_rds_mariadb_default.id
  type              = var.aws_sr_rds_mariadb_default_internet_to_db_port["type"]
  from_port         = var.aws_sr_rds_mariadb_default_internet_to_db_port["from_port"]
  to_port           = var.aws_sr_rds_mariadb_default_internet_to_db_port["to_port"]
  protocol          = var.aws_sr_rds_mariadb_default_internet_to_db_port["protocol"]
  cidr_blocks       = [format("%s/%s", data.external.whatismyip.result["internet_ip"], 32)]
  #sec_rule_ec2_default_internet_to_ssh["cidr_blocks"]
  description = var.aws_sr_rds_mariadb_default_internet_to_db_port["description"]
}
