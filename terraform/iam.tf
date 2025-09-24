resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.app_name}-task-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Principal = { Service = "ecs-tasks.amazonaws.com" }
      Effect = "Allow"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "exec_role_attach" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_cloudwatch_log_group" "strapi" {
  name              = "/ecs/${var.app_name}"
  retention_in_days = 7
}
