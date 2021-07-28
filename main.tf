provider "aws" {
  region = lookup(var.awsprops, "region")
}

resource "aws_security_group" "app_server-sg" {
  name        = lookup(var.awsprops, "secgroupname")
  description = lookup(var.awsprops, "secgroupname")
  vpc_id      = lookup(var.awsprops, "vpc")

  // To Allow SSH Transport
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 80 Transport
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "app_server" {
  # ami           = "ami-830c94e3"
  # instance_type = "t2.micro"

  # tags = {
  #   Name = var.instance_name
  # }
  ami                         = lookup(var.awsprops, "ami")
  instance_type               = lookup(var.awsprops, "type")
  subnet_id                   = lookup(var.awsprops, "subnet") #FFXsubnet2
  associate_public_ip_address = lookup(var.awsprops, "publicip")


  vpc_security_group_ids = [
    aws_security_group.app_server-sg.id
  ]
  tags = {
    Name        = lookup(var.instance_name, "name")
    Environment = lookup(var.instance_name, "environment")
  }

  depends_on = [aws_security_group.app_server-sg]
}
