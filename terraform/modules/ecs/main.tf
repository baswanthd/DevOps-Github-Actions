resource "aws_ecs_cluster" "central-cluster" {
  name = "central-cluster"

  configuration {
    execute_command_configuration {
      # kms_key_id = aws_kms_key.example.arn
      logging = "OVERRIDE"

      log_configuration {
        #cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name = aws_cloudwatch_log_group.cloud-watch-lg.name
      }
    }
  }
}

resource "aws_cloudwatch_log_group" "cloud-watch-lg" {
  name = "cloud-watch-lg"
  retention_in_days = 3
}
