

resource "aws_db_subnet_group" "rds_subnets" {
  name       = "${var.app_name}-rds-default-subnets"
  subnet_ids = data.aws_subnets.default.ids   # Reuse from vpc.tf

  tags = {
    Name = "${var.app_name}-rds-default"
  }
}

resource "aws_db_instance" "postgres" {
  identifier              = "${var.app_name}-db"
  engine                  = "postgres"
  engine_version          = "15"
  instance_class          = "db.t3.micro"
  db_name                 = var.database_name
  username                = var.database_username
  password                = var.database_password
  allocated_storage       = 20
  skip_final_snapshot     = true
  publicly_accessible     = true
  db_subnet_group_name    = aws_db_subnet_group.rds_subnets.name
  vpc_security_group_ids  = [aws_security_group.ecs_sg.id] # allow ECS tasks to access DB
  port                    = var.database_port

  tags = {
    Name = "${var.app_name}-postgres"
  }
}
