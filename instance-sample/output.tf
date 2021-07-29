output "ec2instance" {
  value = aws_instance.app_server.public_ip
}

output "public_dns" {
  description = "Public DNS of instance (or DNS of EIP)"
  value       = aws_instance.app_server.public_dns
}
