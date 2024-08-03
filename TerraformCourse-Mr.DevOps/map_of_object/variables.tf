variable "vpcs" {
  type = map(object({
    cidr = string
    instance_tenancy = string
    tags = map(string)
  }))
  default = {
    "1" = {
      cidr = "10.0.0.0/16"
      instance_tenancy = "default"
      tags = {
        "Name" = "dev"
      }
    }

    "2" = {
      cidr = "10.0.0.0/24"
      instance_tenancy = "default"
      tags = {
        "Name" = "prod"
      }
    }
  }
}