output "alb_dns" {
  description = "ALB DNS name to access Strapi"
  value       = aws_lb.app.dns_name
}

output "ecr_repo_url" {
  description = "ECR repo url"
  value       = aws_ecr_repository.strapi.repository_url
}
