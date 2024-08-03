provider "aws" {
  profile = "myaws"
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = "172.16.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "172.16.10.0/24"

  tags = {
    Name = "Main"
  }
}

resource "aws_network_interface" "test" {
  subnet_id       = aws_subnet.main.id
  private_ips     = ["172.16.10.100"]
}

resource "aws_instance" "Multiblock" {
  ami           = "ami-007855ac798b5175e" 
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.test.id
    device_index         = 0
  }
}
