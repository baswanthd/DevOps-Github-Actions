resource "aws_ecs_service" "bmi-bas8" {
  name            = "bmi-bas8"
  cluster         =  aws_ecs_cluster.baswanth_ecs_cluster.id
  task_definition =  aws_ecs_task_definition.bmi-bas-service-tf.arn
  desired_count   = 1
  #iam_role        = aws_iam_role.foo.arn
  #depends_on      = [aws_iam_role_policy.foo]
  launch_type = "FARGATE"


network_configuration {
  subnets = aws_subnet.private_subnets[*].id
  security_groups = [aws_security_group.allow_everything.id]
  assign_public_ip = false
  }

  # ordered_placement_strategy {
  #   type  = "binpack"
  #   field = "cpu"
  # }

  load_balancer {
    target_group_arn = aws_lb_target_group.bas_app_tg.arn
    container_name   = "first"
    container_port   = 8000
  }
}
  # placement_constraints {
  #   type       = "memberOf"
  #   expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  # } */

