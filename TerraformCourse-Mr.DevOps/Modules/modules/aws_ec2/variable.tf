variable "instance_name" {
  type = map(any)
  default = {
    "Name" = "Prod-Server"
  }
}

variable "instance_ami" {
  default = "ami-007855ac798b5175e"
  type = string
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "nic_id" {
  type = string
}