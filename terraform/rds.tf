resource "aws_db_subnet_group" "rds_subnets" {
  name       = "${var.app_name}-rds-subnet-group"
  subnet_ids = local.public_subnets
  tags = { Name = "${var.app_name}-rds" }
}

resource "aws_db_instance" "postgres" {
  identifier              = "${var.app_name}-db"
  engine                  = "postgres"
  engine_version          = "15"
  instance_class          = "db.t3.micro"
  name                    = var.database_name
  username                = var.database_username
  password                = var.database_password
  allocated_storage       = 20
  skip_final_snapshot     = true
  publicly_accessible     = true
  db_subnet_group_name    = aws_db_subnet_group.rds_subnets.name
  vpc_security_group_ids  = [aws_security_group.ecs_sg.id] # allow ECS tasks to access DB (public for demo)
  port                    = var.database_port
  tags = { Name = "${var.app_name}-postgres" }
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.address
}

# Write the DB host back to local var to be used by ECS task (optional)
