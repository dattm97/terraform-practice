output "ec2instance" {
  value = aws_instance.app_server.public_ip
}
