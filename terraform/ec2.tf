resource "aws_instance" "strapi_ec2" {
  ami           = "ami-08df646e18b182346" # Amazon Linux 2
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.strapi_subnet.id
  vpc_security_group_ids = [aws_security_group.strapi_sg.id]
  key_name      = "strapi-key"

  user_data = <<-EOT
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -a -G docker ec2-user
              docker run -d -p 1337:1337 --name strapi ${var.docker_image}
              EOT
}
