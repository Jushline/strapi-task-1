variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "app_name" {
  type    = string
  default = "strapi-app-jushline"
}

variable "cluster_name" {
  type    = string
  default = "strapi-cluster-jushline"
}

variable "container_port" {
  type    = number
  default = 1337
}

variable "desired_count" {
  type    = number
  default = 1
}

variable "cpu" {
  type    = string
  default = "512"
}

variable "memory" {
  type    = string
  default = "1024"
}

variable "ecr_repo_name" {
  type    = string
  default = "strapi-app"
}

variable "image_tag" {
  type    = string
  default = "latest"
}

# ----------------------
# Strapi required secrets
# ----------------------

variable "app_keys" {
  type        = string
  description = "Comma-separated app.keys (at least 4)"
}

variable "api_token_salt" {
  type = string
}

variable "admin_jwt_secret" {
  type = string
}

variable "transfer_token_salt" {
  type    = string
  default = ""
}

variable "encryption_key" {
  type    = string
  default = ""
}

# ----------------------
# Database settings (for RDS)
# ----------------------

variable "database_client" {
  type    = string
  default = "postgres"
}

variable "database_host" {
  type    = string
  default = "" # will be filled by rds.tf output
}

variable "database_port" {
  type    = number
  default = 5432
}

variable "database_name" {
  type    = string
  default = "strapidb"
}

variable "database_username" {
  type    = string
  default = "strapi"
}

variable "database_password" {
  type      = string
  sensitive = true
  default   = ""
}

# ----------------------
# Optional key pair
# ----------------------

variable "key_name" {
  type    = string
  default = ""
}
