resource "aws_ecs_service" "bmi-service" {
  name            = "bmi-service"
  cluster         = aws_ecs_cluster.central-cluster.id
  task_definition = aws_ecs_task_definition.bmi-service.arn
  desired_count   = 1
  #iam_role        = aws_iam_role.foo.arn
  #depends_on      = [aws_iam_role_policy.foo]
  launch_type = "FARGATE"


  network_configuration {
    subnets          = var.subnets
    security_groups  =  [var.fargate_sg]#[aws_security_group.fargate-sg.id]
    assign_public_ip = false
  }

  # load_balancer {
  #   target_group_arn = var.lb_target_group
  #   container_name   = "bmi"
  #   container_port   = 8000
  # }
}

resource "aws_ecs_service" "contact-form" {
  name            = "contact-form"
  cluster         = aws_ecs_cluster.central-cluster.id
  task_definition = aws_ecs_task_definition.contact-form-tf.arn
  desired_count   = 1
#   iam_role        = aws_iam_role.foo.arn
#   depends_on      = [aws_iam_role_policy.foo]
  launch_type     = "FARGATE"

network_configuration {
  subnets = var.subnets
  security_groups = [var.fargate_sg]
  assign_public_ip = false
 }
#  load_balancer {
#     target_group_arn = var.contact_form_tg
#     container_name   = "contact-form"
#     container_port   = 8080
#   }
}
