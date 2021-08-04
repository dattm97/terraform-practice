# Define a record set in Route 53 for the load balancer.
# resource "aws_route53_record" "terraform" {
#   zone_id = data.aws_route53_zone.zone.zone_id
#   name    = "terraform.${var.route53_hosted_zone_name}"
#   type    = "A"

#   alias {
#     name                   = aws_alb.alb.dns_name
#     zone_id                = aws_alb.alb.zone_id
#     evaluate_target_health = true
#   }
# }
