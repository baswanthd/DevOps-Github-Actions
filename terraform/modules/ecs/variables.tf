# variable "cluster_id" {
#   default = aws_ecs_cluster.central-cluster.id
# }

variable "execution_role_arn" {}

variable "subnets" {}

variable "fargate_sg" {}

variable "lb_target_group" {}

#variable "contact_form_tg" {}

#variable "lb_listner" {}

# variable "task_definition_arn" {
#   default = aws_ecs_task_definition.bmi-service.arn
# }

# variable "image" {
#   default = "124937358799.dkr.ecr.eu-central-1.amazonaws.com/centralecr:f531fd88c12b8c3e5b15a4429ec157bceccc7714"
# }


