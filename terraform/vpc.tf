# Use the default VPC
data "aws_vpc" "default" {
  default = true
}

# Fetch subnets inside the default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

locals {
  # Use all default subnets (spans AZs for HA)
  public_subnets = data.aws_subnets.default.ids
}

output "subnet_ids" {
  value = local.public_subnets
}
