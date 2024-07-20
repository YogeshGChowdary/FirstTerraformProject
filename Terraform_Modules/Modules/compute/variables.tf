variable "environment" {}
variable "amis" {}
variable "aws_region" {}
variable "instance_type" {}
variable "key_name" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "sg_id" {}
variable "vpc_name" {}
variable "elb_listener" {}
variable "iam_instance_profile" {}
variable "elb_listener_public" {}


// variables.tf # example for "ami = lookup(var.amis, var.aws_region)"

variable "aws_region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "amis" {
  description = "A map of region to AMI ID"
  type        = map(string)
  default     = {
    "us-east-1" = "ami-0c55b159cbfafe1f0"
    "us-west-2" = "ami-0b9c9f62cebd634d9"
    "eu-west-1" = "ami-04a81a99f5ec58529"
  }
}
