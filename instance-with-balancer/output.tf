output "app_public_ip" {
  value = {
    for instance in aws_instance.instance-app :
    instance.id => instance.public_ip
  }
}

output "public_dns" {
  value = {
    for instance in aws_instance.instance-app :
    instance.id => instance.public_dns
  }
}

output "lb_hostname_http" {
  value = aws_lb.app.dns_name
}
