#AWS Subnet attached to AWS VPC

resource "aws_subnet" "my_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.subnet_cidr

  tags = var.subnet_name
}

