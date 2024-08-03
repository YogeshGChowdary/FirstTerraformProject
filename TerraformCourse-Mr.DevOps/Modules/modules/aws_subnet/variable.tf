variable "vpc_id" {
  type = string
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