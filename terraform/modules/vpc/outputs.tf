output "subnet_id" {
  description = "Public Subnet ID"
  value       = aws_subnet.subnet.id
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.web-sg.id
}