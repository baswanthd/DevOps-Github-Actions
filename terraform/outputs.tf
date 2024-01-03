output "loadbalancer_dns-name" {
  value = aws_lb.bas_app_lb.dns_name
}

output "loadbalancer_public_ip" {
  value = aws_lb.bas_app_lb.ip_address_type
}

output "fargate_ip" {
  value = aws_ecs_service.bmi-bas8.network_configuration
}
