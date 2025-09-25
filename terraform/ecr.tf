resource "aws_ecr_repository" "strapi_app" {
  name                 = "strapi-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
