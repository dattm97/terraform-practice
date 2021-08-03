output "ec2_public_ip" {
  value = module.aws_ec2_pro_pub_wp_01.public_ip
}

output "endpoint_rds" {
  value       = module.aws_rds_mariadb_pro_pri_01.endpoint
}
