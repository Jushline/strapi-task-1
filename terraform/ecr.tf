resource "aws_ecr_repository" "strapi" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "MUTABLE"  # use MUTABLE for 'latest' flow; change to IMMUTABLE for immutable tags
  image_scanning_configuration {
    scan_on_push = true
  }
}
