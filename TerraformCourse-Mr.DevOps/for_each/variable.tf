variable "vpc_cidr" {
  default = {
    "dev" = "10.0.0.0/16"
    "prod" = "10.0.0.0/24"
  }
}