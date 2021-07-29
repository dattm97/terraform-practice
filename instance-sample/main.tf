provider "aws" {
  region = lookup(var.awsprops, "region")
}

resource "aws_instance" "app_server" {
  ami                         = lookup(var.awsprops, "ami")
  instance_type               = lookup(var.awsprops, "type")
  associate_public_ip_address = lookup(var.awsprops, "publicip")
  key_name                    = aws_key_pair.user_key.key_name
  subnet_id                   = aws_subnet.http.id
  user_data                   = file("scripts/first-boot.sh")
  vpc_security_group_ids = [
    aws_security_group.app_server_sg.id
  ]

  tags = {
    Name        = lookup(var.instance_name, "name")
    Environment = lookup(var.instance_name, "environment")
  }
}

# Attach floating ip on instance http
resource "aws_eip" "public_http" {
  vpc        = true
  instance   = aws_instance.app_server.id
  depends_on = [aws_internet_gateway.gw]
  tags = {
    Name = lookup(var.instance_name, "elasticIP")
  }
}
