 variable "vpc_cidr" {
  default = "172.16.0.0/16"
  type = string
}

variable "vpc_name" {
  type = map(any)
  default = {
    "Name" = "tf-example"
  }
}


variable "subnet_cidr" {
  default = "172.16.10.0/24"
  type = string
}

variable "subnet_name" {
  type = map(any)
  default = {
    "Name" = "my_subnet"
  }
}

variable "sg_name" {
  type = map(any)
  default = {
    "Name" = "allow_tls"
  }
}


variable "nic_name" {
  type = map(any)
  default = {
    "Name" = "my_nic"
  }
}

variable "private_ips" {
  type = list(string)
  default = ["172.16.10.100"]
}

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


variable "instance_config" {
  type = map(any)
}

