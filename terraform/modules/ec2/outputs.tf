output "public_ip" {
  description = "Publiv IP of the EC2 Server"
  value       = aws_instance.lab_ec2.public_ip
}