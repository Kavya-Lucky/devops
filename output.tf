output "server_private_ip" {
  value = aws_instance.project-iac.private_ip
}
output "server_public_ipv4" {
  value = aws_instance.project-iac.public_ip
}
output "server_id" {
  value = aws_instance.project-iac.id
}

output "ec2instance" {
  value = aws_instance.project-iac.public_ip
}