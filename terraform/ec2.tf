resource "aws_instance" "strapi_ec2" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = "strapi-key-jushline"

  subnet_id              = element(data.aws_subnet_ids.default.ids, 0)
  vpc_security_group_ids = [aws_security_group.strapi_sg.id]

  tags = {
    Name    = "${var.project_tag}-ec2"
    Project = var.project_tag
  }

  user_data = <<-EOT
    #!/bin/bash
    yum update -y
    amazon-linux-extras enable docker
    yum install -y docker
    systemctl start docker
    systemctl enable docker
    usermod -aG docker ec2-user
    docker run -d --restart unless-stopped -p 1337:1337 --name strapi jushlineanitha/strapi-app:latest
  EOT
}
