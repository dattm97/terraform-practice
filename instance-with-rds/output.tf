# Define the load balancer DNS name as an output variable.
output "lb_dns_name" {
  value = aws_alb.alb.dns_name
}

output "db_endpoint" {
  value = aws_db_instance.default.endpoint
}
