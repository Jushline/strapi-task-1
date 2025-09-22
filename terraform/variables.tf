variable "docker_image" {
  description = "Docker image for Strapi (example: jushlineanitha/strapi-app:latest)"
  type        = string
}

variable "key_name" {
  description = "Name of existing EC2 key pair in AWS (must exist)"
  type        = string
  default     = "strapi-key-jushline"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "project_tag" {
  description = "Project tag used for naming resources"
  type        = string
  default     = "Task-5-jushline"
}
