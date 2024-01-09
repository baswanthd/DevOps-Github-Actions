resource "aws_ecs_service" "bmi-service" {
  name            = "bmi-service"
  cluster         = module.ecs.default #aws_ecs_cluster.central-cluster.id
  task_definition = module.ecs.default #aws_ecs_task_definition.bmi-service.arn
  desired_count   = 1
  #iam_role        = aws_iam_role.foo.arn
  #depends_on      = [aws_iam_role_policy.foo]
  launch_type = "FARGATE"


  network_configuration {
    subnets          = module.common_vpc.private_subnet_ids
    security_groups  = [aws_security_group.fargate-sg.id]
    assign_public_ip = false
  }

  # ordered_placement_strategy {
  #   type  = "binpack"
  #   field = "cpu"
  # }

  load_balancer {
    target_group_arn = aws_lb_target_group.central-app-tg.arn
    container_name   = "bmi"
    container_port   = 8000
  }
}
# placement_constraints {
#   type       = "memberOf"
#   expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
# } */

# resource "aws_ecs_service" "contact-form" {
#   name            = "contact-form"
#   cluster         = aws_ecs_cluster.contact-form-tf.id
#   task_definition = aws_ecs_task_definition.contact-form-tf.arn
#   desired_count   = 1
# #   iam_role        = aws_iam_role.foo.arn
# #   depends_on      = [aws_iam_role_policy.foo]
#   launch_type     = "FARGATE"

# network_configuration {
#   subnets = module.common_vpc.private_subnet_ids
#   security_groups = [aws_security_group.fargate-sg.id]
#   assign_public_ip = false
#  }
#  load_balancer {
#     target_group_arn = aws_lb_target_group.contact-form-tg.arn
#     container_name   = "contact-form"
#     container_port   = 8080
#   }
# }
