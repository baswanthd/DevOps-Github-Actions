resource "aws_ecs_task_definition" "baswanth-bmi-service" {
  family = "bmi-service"
  container_definitions = jsonencode([
  {
   name = "bas-first"
   image = "124937358799.dkr.ecr.eu-west-2.amazonaws.com/devops_repro"
   cpu = 0
   memory = 512
   essentials = true
   portMapping = [
   {
     containerPort = 8000
     hostPort = 8000
   }
  ]
  }
])
}
