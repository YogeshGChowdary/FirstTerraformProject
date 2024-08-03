provider "aws" {
  profile = "myaws"
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id


    dynamic "ingress" {
        for_each = var.aws_sg

        content {
            description      = ingress.value.description
            from_port        = ingress.value.port
            to_port          = ingress.value.port
            protocol         = ingress.value.protocol
            cidr_blocks      = ingress.value.cidr_blocks

            }
        }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}