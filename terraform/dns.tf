resource "aws_route53_zone" "primary" {
  name = "test.baswanth-tech.de"
}

resource "aws_route53_record" "test" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "test.baswanth-tech.de"
  type    = "A"
  ttl     = 10
  records = [aws_eip.bas_app_lb.public_ip]
}
