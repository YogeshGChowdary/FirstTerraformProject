provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server" {
  ami = "ami-xxxxxxxxxxxxx"
  instance_type = "t2.micro"
  subnet_id = "subnet-00000000000000"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "statefilecheckbucket"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name = "terraform_lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}