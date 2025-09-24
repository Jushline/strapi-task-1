# ✅ Use existing ECS execution role instead of creating a new one
data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole" # <-- confirm this name in AWS Console > IAM > Roles
}

resource "aws_cloudwatch_log_group" "strapi" {
  name              = "/ecs/${var.app_name}"
  retention_in_days = 7
}
