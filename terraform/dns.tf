resource "aws_route53_zone" "primary" {
  name = "test.baswanth-tech.de"
}

resource "aws_route53_record" "test" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "test.baswanth-tech.de"
  type    = "A"
  ttl     = 10
  records = data.dns_a_record_set.lb_ips.addrs
}
