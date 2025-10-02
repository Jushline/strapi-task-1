# rds.tf

# Use the public/default subnet IDs (you already have data.aws_subnets.default in vpc.tf)
resource "aws_db_subnet_group" "rds_subnets" {
  name       = "${var.app_name}-rds-subnet-group"
  subnet_ids = data.aws_subnets.default.ids

  tags = {
    Name = "${var.app_name}-rds-subnet-group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier            = "${var.app_name}-db"
  engine                = "postgres"
  engine_version        = "15"
  instance_class        = "db.t3.micro"
  db_name               = var.database_name
  username              = var.database_username
  password              = var.database_password
  allocated_storage     = 20
  skip_final_snapshot   = true
  publicly_accessible   = true
  db_subnet_group_name  = aws_db_subnet_group.rds_subnets.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]  # use dedicated rds_sg
  port                  = var.database_port

  tags = {
    Name = "${var.app_name}-postgres"
  }
}

output "rds_endpoint" {
  description = "Public RDS endpoint (address)"
  value       = aws_db_instance.postgres.address
}
