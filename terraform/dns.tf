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

resource "aws_route53_zone" "second" {
  name = "sub.baswanth-tech.de"
}

resource "aws_route53_record" "sub" {
  zone_id = aws_route53_zone.second.zone_id
  name    = "sub.baswanth-tech.de"
  type    = "A"
  ttl     = 10
  records = data.dns_a_record_set.lb_ips.addrs
}
