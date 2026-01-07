variable "env_name" {
  description = "Name of the Environment"
  type        = string
  default     = "dev"
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "security_group_name" {
  description = "Name of the Security Group"
  type        = string
  default     = "ModuleSecurityGroup"
}