variable "instance_type" {
  description = "Type of the Instance"
  type        = string
  default     = "t3.micro"

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Instance type must be either t2.micro or t3.micro"
  }
}

variable "keypair" {
  description = "KeyPair for EC2"
  type        = string
  default     = "tf-key"
}

variable "subnet_id" {
  type        = string
  description = "subnet id for ec2"
}

variable "security_group_id" {
  type        = string
  description = "security group id for ec2"
}

variable "volume_type" {
  type        = string
  description = "EBS volume type"
  default     = "gp2"

  validation {
    condition     = contains(["gp2", "gp3"], var.volume_type)
    error_message = "Volume type must be gp2 or gp3"
  }
}

variable "volume_size" {
  type        = number
  description = "EBS volume size"
  default     = 20
}

variable "user_data" {
  description = "UserData for EC2 Instance"
  type        = string
}

variable "env_name" {
  description = "Name of the Environment"
  type        = string
  default     = "dev"
}