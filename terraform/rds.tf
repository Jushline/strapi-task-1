# Fetch default VPC
data "aws_vpc" "default" {
  default = true
}

# Fetch subnets in default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Reuse default VPC subnets for RDS
resource "aws_db_subnet_group" "rds_subnets" {
  name       = "${var.app_name}-rds-default-subnets"
  subnet_ids = data.aws_subnets.default.ids

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
  vpc_security_group_ids  = [aws_security_group.ecs_sg.id]
  port                    = var.database_port
  tags = {
    Name = "${var.app_name}-postgres"
  }
}
