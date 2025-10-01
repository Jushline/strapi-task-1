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

# Strapi required secrets (supply via terraform.tfvars or -var in CI)
variable "app_keys" {
  description = "Comma separated Strapi APP_KEYS (at least 4). Example: key1,key2,key3,key4"
  type        = string
}

variable "api_token_salt" {
  description = "API token salt for Strapi (store in terraform.tfvars or secrets)"
  type        = string
}

variable "admin_jwt_secret" {
  description = "Admin JWT secret for Strapi"
  type        = string
}

variable "transfer_token_salt" {
  description = "Transfer token salt"
  type        = string
  default     = ""
}

variable "encryption_key" {
  description = "Encryption key for Strapi"
  type        = string
  default     = ""
}

# Database settings (RDS) - either set database_host (external DB) or let RDS be created locally
variable "database_client" {
  description = "DB client (postgres, mysql, etc)"
  type        = string
  default     = "postgres"
}

variable "database_host" {
  description = "External DB host. If empty Terraform will create an RDS and ECS will point to it."
  type        = string
  default     = ""
}

variable "database_port" {
  description = "Database port"
  type        = number
  default     = 5432
}

variable "database_name" {
  description = "DB name"
  type        = string
  default     = "strapidb"
}

variable "database_username" {
  description = "DB username"
  type        = string
  default     = "strapi"
}

variable "database_password" {
  description = "DB password (sensitive)"
  type        = string
  sensitive   = true
  default     = ""
}
