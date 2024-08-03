provider "aws" {
  profile =  "myaws"
  region = "us-east-1"
}

resource "aws_vpc" "main" {
    for_each = var.vpc_cidr
    cidr_block = each.value

    tags = {
      "Name" = each.key
    }
}


