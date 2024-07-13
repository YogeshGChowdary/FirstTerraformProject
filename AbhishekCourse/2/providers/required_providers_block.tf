terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>3.79"
    }
  }
}

resource "aws_instance" "example" {
  ami = "xxxxx"
  instance_type = "t2.micro"
}