resource "aws_security_group" "allow_everything" {
  name        = "allow_everything"
  description = "Allow everything"
  vpc_id      = module.common_vpc.vpc_id

  ingress {
    description = "Allow-everything from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #["176.198.200.45/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_everything"
  }
}

resource "aws_security_group" "fargate-sg" {
  name        = "fargate-sg"
  description = "fargate-sg with limits"
  vpc_id      = module.common_vpc.vpc_id

  ingress {
    description     = "Allow-everything from VPC"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.allow_everything.id]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fargate-sg"
  }
}