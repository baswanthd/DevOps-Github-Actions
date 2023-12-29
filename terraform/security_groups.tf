resource "aws_security_group" "allow_everything" {
  name        = "allow_everything"
  description = "Allow everything"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description      = "Allow-everything from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_everything"
  }
}