# Create a new application load balancer.
resource "aws_alb" "alb" {
  name            = "terraform-example-alb"
  security_groups = [aws_security_group.alb.id]
  subnets         = aws_subnet.main.*.id

  tags = {
    Name = "terraform-example-alb"
  }
}

# Create a new target group for the application load balancer.
resource "aws_alb_target_group" "group" {
  name     = "terraform-example-alb-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  stickiness {
    type = "lb_cookie"
  }

  # Alter the destination of the health check to be the login page.
  health_check {
    path = "/login"
    port = 80
  }
}

# Create a new application load balancer listener for HTTP.
resource "aws_alb_listener" "listener_http" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.group.arn
    type             = "forward"
  }
}

# # Create a new application load balancer listener for HTTPS.
# resource "aws_alb_listener" "listener_https" {
#   load_balancer_arn = aws_alb.alb.arn
#   port              = "443"
#   protocol          = "HTTPS"
#   # ssl_policy        = "ELBSecurityPolicy-2016-08"
#   # certificate_arn   = var.certificate_arn

#   default_action {
#     target_group_arn = aws_alb_target_group.group.arn
#     type             = "forward"
#   }
# }
