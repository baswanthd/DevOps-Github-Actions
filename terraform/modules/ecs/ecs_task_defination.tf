resource "aws_ecs_task_definition" "bmi-service" {
  family                   = "bmi-service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = var.execution_role_arn #"arn:aws:iam::124937358799:role/ecsTaskExecutionRole"
  container_definitions = jsonencode([
    {
      name      = "bmi"
      image     = "124937358799.dkr.ecr.eu-central-1.amazonaws.com/centralecr:f531fd88c12b8c3e5b15a4429ec157bceccc7714"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 8000
          hostPort      = 8000
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
         # awslogs-create-group  = true
          awslogs-group         = "cloud-watch-lg" #aws_cloudwatch_log_group.cloud-watch-lg.name
          awslogs-region        = var.region
          awslogs-stream-prefix = "awslogs-cloud-watch-bmi"
        }
      }
    }
  ])
}

resource "aws_ecs_task_definition" "contact-form-tf" {
  family                   = "contact-form-tf"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = var.execution_role_arn
  container_definitions = jsonencode([
    {
      name      = "contact-form"
      image     = "124937358799.dkr.ecr.eu-west-2.amazonaws.com/baswanthecr:latest"
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ]
            logConfiguration = {
        logDriver = "awslogs"
        options = {
         # awslogs-create-group  = true
          awslogs-group         = aws_cloudwatch_log_group.cloud-watch-lg.name
          awslogs-region        = var.region
          awslogs-stream-prefix = "awslogs-cloud-watch-cf"
        }
      }
    }
  ])
}
