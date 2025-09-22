data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "strapi_ec2" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.strapi_subnet.id
  vpc_security_group_ids = [aws_security_group.strapi_sg.id]
  key_name               = var.key_name

  tags = {
    Name    = var.project_tag
    Project = var.project_tag
    Owner   = "jushline"
  }

  user_data = <<-EOT
              #!/bin/bash
              set -xe
              exec > /var/log/user-data.log 2>&1

              echo "[user-data] start" 

              yum update -y

              # Install docker reliably
              if ! command -v docker >/dev/null 2>&1; then
                amazon-linux-extras enable docker || true
                yum install -y docker || yum install -y docker-engine || true
              fi

              systemctl start docker || service docker start || true
              systemctl enable docker || true
              usermod -aG docker ec2-user || true

              # allow a small sleep to ensure docker daemon is ready
              sleep 5

              echo "[user-data] pulling and running docker image: ${var.docker_image}"
              # attempt to pull; don't fail the whole script if pull fails (so we can inspect logs)
              docker pull ${var.docker_image} || true

              # run container (will auto pull if missing)
              docker rm -f strapi || true
              docker run -d --restart unless-stopped -p 1337:1337 --name strapi ${var.docker_image} || true

              echo "[user-data] finished"
              EOT
}
