# you cannot directly use variables inside the terraform block when defining the Terraform backend configuration. Instead, you need to hard-code the values for the backend configuration.

terraform {
  backend "s3" {
    bucket = "backendbucketcheck"     
    key = "yogesh/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "terraform-lock"
  }
}