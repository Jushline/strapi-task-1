# alb-sg.tf
resource "aws_security_group" "alb_sg" {
  description = "ALB security group (allow HTTP)"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-alb-sg"
  }
}

resource "aws_security_group" "ecs_sg" {
  description = "ECS tasks security group (accept traffic from ALB)"
  vpc_id      = data.aws_vpc.default.id

  # Allow ALB -> ECS (app port)
  ingress {
    description     = "Allow ALB to talk to container port"
    from_port       = var.container_port
    to_port         = var.container_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  # ECS tasks need outbound to anywhere (to reach RDS/ECR/internet)
  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-ecs-sg"
  }
}

# Separate security group for RDS (more secure, simplest correct wiring)
resource "aws_security_group" "rds_sg" {
  description = "RDS security group (allow postgres from ECS)"
  vpc_id      = data.aws_vpc.default.id

  # Allow ECS tasks (ecs_sg) to connect to Postgres (5432)
  ingress {
    description     = "Allow ECS tasks to connect to Postgres"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_sg.id]
  }

  # RDS needs outbound (NTP, etc) - keep open
  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-rds-sg"
  }
}

# ALB: don't force a custom name that may collide with AWS limits.
# Let AWS/TF assign a friendly name (no name attribute). Security groups + subnets specified.
resource "aws_lb" "app" {
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = local.public_subnets
}
