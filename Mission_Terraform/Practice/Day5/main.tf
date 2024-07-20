provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "example" {
  key_name = "name_of_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "sub" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc

  route {
    gateway_id = aws_internet_gateway.igw
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id = aws_subnet.sub
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "sg" {
  name = "web"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description = "HTTP from VPC"
    from_port = 80
    to_port = 80
    protocol = "tct"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "web"
  }
}

resource "aws_instance" "server" {
  ami = "ami-0000000000000"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.sub.id
  key_name = aws_key_pair.example.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("~./ssh/id_rsa")
    host = self.public_ip
  }

  provisioner "file" {
    source = "app.py"
    destination = "/home/ubuntu/app.py"
  }

  provisioner "remote-exec" {
    inline = [ 
        "echo 'Hello from the remote instance'",
        "sudo apt update -y",  # Update package lists (for ubuntu)
        "sudo apt-get install -y python3-pip",  # Example package installation
        "cd /home/ubuntu",
        "sudo pip3 install flask",
        "sudo python3 app.py &",
    ]
  }
}