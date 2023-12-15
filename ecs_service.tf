resource "aws_ecs_service" "bmi-service-tf" {
  name            = "bmi-service-tf"
  cluster         = aws_ecs_cluster.baswanthaws-ecs.id
  task_definition = "aws_ecs_task_definition.baswanth-bmi-td.arn" 
  desired_count   = 3
  iam_role        = aws_iam_role.foo.arn
  depends_on      = [aws_iam_role_policy.foo]

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.foo.arn
    container_name   = "mongo"
    container_port   = 8080
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  }
}
