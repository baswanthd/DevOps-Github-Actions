output "loadbalancer_dns-name" {
  value = aws_lb.bas_app_lb.dns_name
}

output "lb_ip_type" {
  value = aws_lb.bas_app_lb.ip_address_type
}

output "fargate_ip" {
  value = aws_ecs_service.bmi-bas8.network_configuration
}

data "dns_a_record_set" "lb_ips" {
  host = aws_lb.bas_app_lb.dns_name
}

output "lb_public_ip" {
  value = data.dns_a_record_set.lb_ips.addrs
}