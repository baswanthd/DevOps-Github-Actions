resource "aws_ecs_task_defination" "baswanth-bmi-service" {
  family = "baswanth-bmi-service"
  container_definations = jsonencode([
  {
   name = "bas-first"
   image = 
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
