data "aws_vpc" "default" { default = true }

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

locals {
  public_subnets = data.aws_subnets.default.ids
}

output "subnet_ids" {
  value = local.public_subnets
}
