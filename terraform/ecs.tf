resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "strapi_app" {
  family                   = var.app_name
  cpu                      = var.cpu
  memory                   = var.memory
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  # Execution role required by Fargate to pull images and publish logs
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn      = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = var.app_name
      image     = "${aws_ecr_repository.strapi_app.repository_url}:${var.image_tag}"
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          protocol      = "tcp"
        }
      ]
      environment = concat(
        [
          { name = "HOST", value = "0.0.0.0" },
          { name = "PORT", value = tostring(var.container_port) },
          { name = "APP_KEYS", value = var.app_keys }
        ],
        (
          length(var.database_host) > 0 ? [
            { name = "DATABASE_CLIENT", value = var.database_client },
            { name = "DATABASE_HOST", value = var.database_host },
            { name = "DATABASE_NAME", value = var.database_name },
            { name = "DATABASE_USERNAME", value = var.database_username },
            { name = "DATABASE_PASSWORD", value = var.database_password }
          ] : []
        )
      )
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.strapi.name
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = var.app_name
        }
      }
    }
  ])
}

resource "aws_ecs_service" "strapi" {
  name            = "${var.app_name}-service"
  cluster         = aws_ecs_cluster.this.id
  desired_count   = var.desired_count
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.strapi_app.arn

  network_configuration {
    subnets          = local.public_subnets
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.strapi.arn
    container_name   = var.app_name
    container_port   = var.container_port
  }

  depends_on = [aws_lb_listener.http]
}
