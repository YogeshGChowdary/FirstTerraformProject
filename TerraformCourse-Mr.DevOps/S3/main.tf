provider "aws" {
  region     = "us-east-1"
  profile    = "myaws"
}

resource "aws_instance" "Terraform" {
     ami = "ami-0aa2b7722dc1b5612"
     instance_type = "t2.micro"
     availability_zone = "us-east-1a"

lifecycle {
     ignore_changes = [ami]
     }
 }