variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "app_name" {
  description = "Application name"
  default     = "strapi-app-jushline"
}

variable "cluster_name" {
  default = "strapi-cluster-jushline"
}

variable "container_port" {
  description = "Container port Strapi listens on"
  default     = 1337
}

variable "desired_count" {
  default = 1
}

variable "cpu" {
  description = "Task CPU (Fargate)"
  default     = "512"
}

variable "memory" {
  description = "Task Memory (Fargate in MB)"
  default     = "1024"
}

variable "ecr_repo_name" {
  default = "strapi-app-jushline"
}

# This is the image tag Terraform will use in the task definition.
# We'll default to "latest" for the simpler flow. You can override when applying.
variable "image_tag" {
  default = "latest"
}
