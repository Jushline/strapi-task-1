provider "aws" {
  region     = "ap-south-1" # or your region
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}
