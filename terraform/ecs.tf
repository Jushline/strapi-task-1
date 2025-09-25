resource "aws_ecs_task_definition" "strapi_app" {
  family                   = "strapi-app-jushline"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"

  container_definitions = jsonencode([
    {
      name      = "strapi-app-jushline"
      image     = "${aws_ecr_repository.strapi_app.repository_url}:latest"
      essential = true
      portMappings = [
        {
          containerPort = 1337
          protocol      = "tcp"
        }
      ]
      environment = [
        {
          name  = "HOST"
          value = "0.0.0.0"
        },
        {
          name  = "PORT"
          value = "1337"
        },
        {
          name  = "APP_KEYS"
          value = "key1,key2,key3,key4"
        }
      ]
    }
  ])
}
