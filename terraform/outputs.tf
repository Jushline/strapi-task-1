output "ec2_instance_id" {
  description = "ID of the Strapi EC2 instance"
  value       = aws_instance.strapi_ec2.id
}

output "ec2_public_ip" {
  description = "Public IP of the Strapi EC2 instance"
  value       = aws_instance.strapi_ec2.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS name"
  value       = aws_instance.strapi_ec2.public_dns
}
