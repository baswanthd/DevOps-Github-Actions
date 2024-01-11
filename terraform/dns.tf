data "aws_route53_zone" "primary" {
  zone_id = "Z03704902NJW3IC1VEZPZ"
}

resource "aws_route53_record" "click-record" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "bmi.test.baswanth-tech.de"
  type    = "A"

    alias {
    name                   = aws_lb.central-app-lb.dns_name
    zone_id                = aws_lb.central-app-lb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "click-record" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "contacts.test.baswanth-tech.de"
  type    = "A"

    alias {
    name                   = aws_lb.central-app-lb.dns_name
    zone_id                = aws_lb.central-app-lb.zone_id
    evaluate_target_health = true
  }
}
