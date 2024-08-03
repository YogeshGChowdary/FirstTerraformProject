provider "aws" {
  profile = "myaws"
  region = var.region
}

data "aws_subnet" "subnet" {
  id = var.subnet_id
}

resource "aws_network_interface" "test" {
  subnet_id   = data.aws_subnet.subnet.id
  private_ips = ["172.31.80.10"]
}

resource "aws_instance" "foo" {
  ami           =  var.ami
  instance_type = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.test.id
    device_index         = 0
  }

  tags = {
    Name = "ec2_demo"
  }
}

output "name_of_ec2" {
  value = aws_instance.foo
}