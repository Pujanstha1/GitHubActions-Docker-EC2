provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_name = var.vpc_name
}

module "ec2" {
  source            = "./modules/ec2"
  security_group_id = module.vpc.security_group_id
  subnet_id         = module.vpc.subnet_id
  user_data         = file("user_data.sh")
}