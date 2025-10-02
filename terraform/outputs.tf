output "alb_dns" {
  description = "ALB DNS name to access Strapi"
  value       = aws_lb.app.dns_name
}


output "rds_endpoint" {
  description = "RDS endpoint (if created)"
  value       = try(aws_db_instance.postgres.address, "")
}
