resource "aws_db_subnet_group" "rds_subnets" {
  name_prefix = "${var.app_name}-rds-subnet-"   # ✅ Terraform generates unique name
  subnet_ids  = local.public_subnets

  tags = {
    Name = "${var.app_name}-rds"
  }
}

resource "aws_db_instance" "postgres" {
  identifier_prefix       = "${var.app_name}-db-"   # ✅ avoids duplicate identifier
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
