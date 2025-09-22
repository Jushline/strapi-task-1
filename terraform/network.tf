resource "aws_vpc" "strapi_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name    = "${var.project_tag}-vpc"
    Project = var.project_tag
  }
}

resource "aws_subnet" "strapi_subnet" {
  vpc_id                  = aws_vpc.strapi_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name    = "${var.project_tag}-public-subnet"
    Project = var.project_tag
  }
}

resource "aws_internet_gateway" "strapi_igw" {
  vpc_id = aws_vpc.strapi_vpc.id

  tags = {
    Name    = "${var.project_tag}-igw"
    Project = var.project_tag
  }
}

resource "aws_route_table" "strapi_rt" {
  vpc_id = aws_vpc.strapi_vpc.id

  tags = {
    Name    = "${var.project_tag}-rt"
    Project = var.project_tag
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.strapi_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.strapi_igw.id
}

resource "aws_route_table_association" "strapi_rta" {
  subnet_id      = aws_subnet.strapi_subnet.id
  route_table_id = aws_route_table.strapi_rt.id
}
