# Create a VPC to launch our instances into.
resource "aws_vpc" "vpc" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "terraform-example-vpc"
  }
}

# Create an internet gateway to give our subnet access to the outside world.
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "terraform-example-internet-gateway"
  }
}

# Grant the VPC internet access on its main route table.
resource "aws_route" "route" {
  route_table_id         = aws_vpc.vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gateway.id
}

# Create subnets in each availability zone to launch our instances into, each with address blocks within the VPC.
resource "aws_subnet" "main" {
  count                   = length(data.aws_availability_zones.available.names)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "172.31.${count.index}.0/24"
  map_public_ip_on_launch = true
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "public-${element(data.aws_availability_zones.available.names, count.index)}"
  }
}
