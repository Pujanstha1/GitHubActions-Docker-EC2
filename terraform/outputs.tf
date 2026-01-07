output "public_ip" {
  description = "EC2 Server Public IP"
  value       = module.ec2.public_ip
}