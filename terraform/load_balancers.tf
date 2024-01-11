resource "aws_lb" "central-app-lb" {
  name                       = "central-app-lb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.allow_everything.id]
  subnets                    = module.common_vpc.public_subnet_ids
  enable_deletion_protection = false

    access_logs {
      bucket  = aws_s3_bucket.log-bucket-central.id
      prefix  = "log"
      enabled = true
    }
}

# resource "aws_lb_target_group" "central-app-tg" {
#   name        = "central-app-tg"
#   port        = "8000"
#   protocol    = "HTTP"
#   target_type = "ip"
#   vpc_id      = module.common_vpc.vpc_id
  #depends_on = [aws_lb_listener.central-app-listner]
#}

# resource "aws_lb_listener" "central-app-listner" {
#   load_balancer_arn = aws_lb.central-app-lb.arn
#   port              = "80"
#   protocol          = "HTTP"

  # default_action {
  #   type             = "forward"
  #   target_group_arn = aws_lb_target_group.central-app-tg.arn
  # }
}

# resource "aws_lb_target_group" "contact-form-tg" {
#   name        = "contact-form-tg"
#   port        = "8080"
#   protocol    = "HTTP"
#   target_type = "ip"
#   vpc_id      = module.common_vpc.vpc_id
# }

# resource "aws_lb_listener" "contact-form-front_end" {
#   load_balancer_arn = aws_lb.central-app-lb.arn
#   port              = "8080"
#   protocol          = "HTTP"

  # default_action {
  #   type             = "forward"
  #   target_group_arn = aws_lb_target_group.contact-form-tg.arn
  # }

}