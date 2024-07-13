provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example_web" {
  ami = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  subnet_id = "subnet-019ea91ed9b5252e7" #change this
}

resource "aws_s3_bucket" "s3_backend" {
  bucket = "backendbucketcheck"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}