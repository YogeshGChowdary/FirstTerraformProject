# # Different ways to configure providers block
# 1. root module
# 2. child module
# 3. required providers


provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami = ""
  instance_type = ""
}