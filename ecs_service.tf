resource "aws_ecs_service" "bmi-bas8" {
  name            = "bmi-bas8"
  cluster         =  aws_ecs_cluster.baswanth_ecs_cluster.id
  task_definition =  aws_ecs_task_definition.bmi-service8.arn
  desired_count   = 1
  #iam_role        = aws_iam_role.foo.arn
  #depends_on      = [aws_iam_role_policy.foo]
  launch_type = "FARGATE"


network_configuration {
  subnets = [ "subnet-01480a618ac23bf02", "subnet-09d97b80d657b45c8", "subnet-00582281cf7d0e00c" ]
  security_groups = [ "sg-051b7d20f5f894279" ]
  assign_public_ip = true
  }
}
 /* ordered_placement_strategy {
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
  } */

