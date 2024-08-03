provider "aws" {
  profile = "myaws"
  region = "us-east-1"
}

resource "aws_vpc" "main" {
    for_each = var.vpcs
    cidr_block = each.value.cidr
    instance_tenancy = each.value.instance_tenancy

    tags = each.value["tags"]
    
}