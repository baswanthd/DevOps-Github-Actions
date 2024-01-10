output "loadbalancer_dns-name" {
  value = aws_lb.central-app-lb.dns_name
}

output "lb_ip_type" {
  value = aws_lb.central-app-lb.ip_address_type
}

output "fargate_ip" {
  value = aws_ecs_service.bmi-service.network_configuration
}

data "dns_a_record_set" "lb_ips" {
  host = aws_lb.central-app-lb.dns_name
}

output "lb_public_ip" {
  value = data.dns_a_record_set.lb_ips.addrs
}

output "vpc_id" {
  #value = "${aws_vpc.central_vpc.id}"
  value = module.common_vpc.vpc_id
}