resource "aws_lb" "bas_app_lb" {
  name               = "bas-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_everything.id]
  subnets            = [ "subnet-01480a618ac23bf02", "subnet-09d97b80d657b45c8", "subnet-00582281cf7d0e00c" ]

  enable_deletion_protection = false

#   access_logs {
#     bucket  = "bas-bucket-box"
#     prefix  = "bas-lb"
#     enabled = true
  }

resource "aws_lb_target_group" "bas_app_tg" {
  name        = "bas-lb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = "vpc-02fa7bb78ea63c332"
}

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
# }
#   tags = {
#     Environment = "Learning"
#   }
#}

resource "aws_lb_listener" "app_front_end" {
  load_balancer_arn = aws_lb.bas_app_lb.arn
  port              = "80"
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.bas_app_tg.arn
  }
}