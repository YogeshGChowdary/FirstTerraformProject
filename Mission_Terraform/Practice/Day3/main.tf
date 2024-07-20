provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "./modules/ec2_instances"
  ami_value = var.ami 
  instance_type_value = var.instance_type
  subnet_id_value = var.subnet_id
}