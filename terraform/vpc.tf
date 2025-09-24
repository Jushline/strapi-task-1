# Use the default VPC and its subnets
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

locals {
  # Use the first two subnets for ALB across AZs; if you want all, use data.aws_subnet_ids.default.ids
  public_subnets = data.aws_subnet_ids.default.ids
}
