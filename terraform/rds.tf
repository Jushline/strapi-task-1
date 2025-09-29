resource "aws_db_subnet_group" "strapi" {
  name       = "strapi-db-subnets"
  subnet_ids = local.public_subnets
}

resource "aws_db_instance" "strapi" {
  identifier             = "strapi-db"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "15.5"
  instance_class         = "db.t3.micro"
  username               = var.db_username
  password               = var.db_password
  db_name                = var.db_name
  db_subnet_group_name   = aws_db_subnet_group.strapi.name
  vpc_security_group_ids = [aws_security_group.ecs_sg.id]
  publicly_accessible    = true
  skip_final_snapshot    = true
}
