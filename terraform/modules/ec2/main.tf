resource "aws_instance" "lab_ec2" {
  ami           = "ami-084568db4383264d4"
  instance_type = var.instance_type
  key_name      = var.keypair

  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = true
  }

  user_data = var.user_data

  tags = {
    Name = "${var.env_name}-EC2"
  }
}
