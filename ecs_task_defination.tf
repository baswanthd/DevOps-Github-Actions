resource "aws_ecs_task_definition" "bmi-bas-service-tf" {
  family = "devops-bmi1-taskdef"
  requires_compatibilities = [ "FARGATE" ]
  network_mode = "awsvpc"
  cpu = 256
  memory = 512
  execution_role_arn =  "arn:aws:iam::124937358799:role/ecsTaskExecutionRole"
  container_definitions = jsonencode([
    {
      name      = "first"
      image     = "124937358799.dkr.ecr.eu-west-2.amazonaws.com/devops_repro"
      cpu       = 0
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 8000
          hostPort      = 8000
        }
      ]
    }
  ])
}
