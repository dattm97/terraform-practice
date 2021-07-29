# Manage load balancer

#### HTTP LOADBLANCER #####

# Create network load balancer
resource "aws_lb" "app" {
  name               = "app-lb"
  subnets            = aws_subnet.app.*.id
  load_balancer_type = "network"
  tags = {
    Name = "http-lb"
  }
}

# Create listener for load balancer http
resource "aws_lb_listener" "app" {
  load_balancer_arn = aws_lb.app.id
  port              = "80"
  protocol          = "TCP"
  default_action {
    target_group_arn = aws_lb_target_group.app.id
    type             = "forward"
  }
}

# Create target group lb
resource "aws_lb_target_group" "app" {
  name     = "http-lb-target-group"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.terraform.id
  tags = {
    Name = "http-lb-target-group"
  }
}

# Add instance to load balancer
resource "aws_lb_target_group_attachment" "app" {
  for_each         = var.app_names
  target_group_arn = aws_lb_target_group.app.arn
  target_id        = aws_instance.instance-app[each.key].id
  port             = 80
}
