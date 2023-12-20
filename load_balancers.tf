resource "aws_lb" "bas_app_lb" {
  name               = "bas-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_everything.id]
  subnets            = [ "subnet-01480a618ac23bf02", "subnet-09d97b80d657b45c8", "subnet-00582281cf7d0e00c" ]

  enable_deletion_protection = true

#   access_logs {
#     bucket  = "bas-bucket-box"
#     prefix  = "bas-lb"
#     enabled = true
#   }

  tags = {
    Environment = "Learning"
  }
}