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
  description = "ECR repository name"
  default     = "strapi-app-jushline"
}

variable "image_tag" {
  description = "Tag for Docker image"
  default     = "latest"
}

variable "docker_image" {
  description = "ECR image URI for Strapi app"
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
}
