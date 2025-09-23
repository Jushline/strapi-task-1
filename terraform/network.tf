# Use the default VPC instead of creating a new one
data "aws_vpc" "default" {
  default = true
}

# Get the default subnets in the default VPC
data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

# (Optional) If you want to see subnet details
data "aws_subnet" "default_subnet" {
  id = element(data.aws_subnet_ids.default.ids, 0)
}

# Security Group for Strapi
resource "aws_security_group" "strapi_sg" {
  name        = "${var.project_tag}-sg"
  description = "Allow SSH, HTTP, and Strapi access"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Strapi"
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project_tag}-sg"
    Project = var.project_tag
  }
}
