variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "app_name" {
  description = "Application name"
  default     = "strapi-app-jushline"
}

variable "image_tag" {
  description = "Docker image tag to deploy"
  type        = string
  default     = "latest"
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
  default     = "strapi-app"
}

variable "docker_image" {
  description = "ECR image URI for Strapi app"
  type        = string
  default     = "884740154069.dkr.ecr.ap-south-1.amazonaws.com/strapi-app:latest"
}

variable "key_name" {
  description = "Name of the EC2 key pair (not used by Fargate, present for compatibility)"
  type        = string
  default     = "linux-key"
}
