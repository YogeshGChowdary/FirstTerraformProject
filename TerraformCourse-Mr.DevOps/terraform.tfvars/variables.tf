variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_id" {
  default = "subnet-05a4b1b13c5479c44"
}

variable "ami" {
  default = "ami-007855ac798b5175e"
  type = string
  description = "instance ami"
}