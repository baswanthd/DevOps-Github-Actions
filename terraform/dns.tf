# resource "aws_route53_zone" "primary" {
#   name = "bmi.baswanth-tech.de"
# }

data "aws_route53_zone" "primary" {
  name         = "test.baswanth-tech.de"
  zone_id = "Z03704902NJW3IC1VEZPZ"
  #private_zone = false
}

resource "aws_route53_record" "click-record" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "bmi.test.baswanth-tech.de"
  type    = "A"
  #ttl     = 10
  #records = data.dns_a_record_set.lb_ips.addrs

    alias {
    name                   = aws_lb.central-app-lb.dns_name
    zone_id                = aws_lb.central-app-lb.zone_id
    evaluate_target_health = true
  }
}

# resource "aws_route53_zone" "second" {
#   name = "contacts.baswanth-tech.de"
# }

# resource "aws_route53_record" "sub" {
#   zone_id = aws_route53_zone.second.zone_id
#   name    = "contacts.baswanth-tech.de"
#   type    = "A"
#   ttl     = 10
#   records = data.dns_a_record_set.lb_ips.addrs
# }

