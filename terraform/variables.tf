variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "app_name" {
  description = "Application name (used for naming resources)"
  type        = string
  default     = "strapi-app-jushline"
}

variable "cluster_name" {
  description = "ECS cluster name"
  type        = string
  default     = "strapi-cluster-jushline"
}

variable "container_port" {
  description = "Container port Strapi listens on"
  type        = number
  default     = 1337
}

variable "desired_count" {
  description = "ECS service desired count"
  type        = number
  default     = 1
}

variable "cpu" {
  description = "Task CPU (Fargate)"
  type        = string
  default     = "512"
}

variable "memory" {
  description = "Task Memory (Fargate in MB)"
  type        = string
  default     = "1024"
}

variable "ecr_repo_name" {
  description = "ECR repository name"
  type        = string
  default     = "strapi-app"
}

variable "image_tag" {
  description = "Docker image tag to deploy"
  type        = string
  default     = "latest"
}

# ----------------------
# 🔑 Strapi required secrets
# ----------------------

variable "app_keys" {
  description = "Comma separated Strapi APP_KEYS (at least 4). Example: key1,key2,key3,key4"
  type        = string
  default     = "replace_me_keyA,replace_me_keyB,replace_me_keyC,replace_me_keyD"
}

variable "api_token_salt" {
  description = "API token salt for Strapi (store in terraform.tfvars)"
  type        = string
  default     = ""
}

variable "admin_jwt_secret" {
  description = "Admin JWT secret for Strapi (store in terraform.tfvars)"
  type        = string
  default     = ""
}

variable "transfer_token_salt" {
  description = "Transfer token salt for Strapi (store in terraform.tfvars)"
  type        = string
  default     = ""
}

variable "encryption_key" {
  description = "Encryption key for Strapi (store in terraform.tfvars)"
  type        = string
  default     = ""
}

# ----------------------
# Optional Database settings
# ----------------------

variable "database_client" {
  description = "DB client (postgres, mysql, etc)"
  type        = string
  default     = ""
}

variable "database_host" {
  type    = string
  default = ""
}

variable "database_name" {
  type    = string
  default = ""
}

variable "database_username" {
  type    = string
  default = ""
}

variable "database_password" {
  type    = string
  default = ""
}
