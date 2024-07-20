terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key = "path/to/your/terraform.tfstate inside bucket"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "your-dynamodb-table"
  }
}