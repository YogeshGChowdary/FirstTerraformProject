provider "aws" {
  profile = "myaws"
  region = var.region
}

data "aws_subnet" "subnet" {
  id = "subnet-05a4b1b13c5479c44"
}

resource "aws_network_interface" "test" {
  subnet_id   = data.aws_subnet.subnet.id
  private_ips = ["172.31.80.10"]
}

resource "aws_instance" "foo" {
  ami           = "ami-007855ac798b5175e" 
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.test.id
    device_index         = 0
  }

  tags = {
    Name = "ec2_demo"
  }
}