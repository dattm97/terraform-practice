provider "aws" {
  region = lookup(var.awsprops, "region")
}

resource "aws_instance" "instance-app" {
  for_each                    = var.app_names
  ami                         = lookup(var.awsprops, "ami")
  instance_type               = lookup(var.awsprops, "type")
  associate_public_ip_address = lookup(var.awsprops, "publicip")
  key_name                    = aws_key_pair.user_key.key_name
  subnet_id                   = aws_subnet.app.id
  user_data                   = file("scripts/first-boot.sh")
  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]

  tags = {
    Name = each.key
  }
}

# Attach floating ip on instance http
resource "aws_eip" "elastic_ip" {
  for_each   = var.app_names
  vpc        = true
  instance   = aws_instance.instance-app[each.key].id
  depends_on = [aws_internet_gateway.gw]
  tags = {
    Name = "elastic-ip-${each.key}"
  }
}
