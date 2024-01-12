data "aws_route53_zone" "primary" {
  zone_id = var.dns_zone_id
}

resource "aws_route53_record" "click-record" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = var.dns_name_bmi
  type    = "A"

  alias {
    name                   = aws_lb.central-app-lb.dns_name
    zone_id                = aws_lb.central-app-lb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "contact-record" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = var.dns_name_contacts
  type    = "A"

  alias {
    name                   = aws_lb.central-app-lb.dns_name
    zone_id                = aws_lb.central-app-lb.zone_id
    evaluate_target_health = true
  }
}
