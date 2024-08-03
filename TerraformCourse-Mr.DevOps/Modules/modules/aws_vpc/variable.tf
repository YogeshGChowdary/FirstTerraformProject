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