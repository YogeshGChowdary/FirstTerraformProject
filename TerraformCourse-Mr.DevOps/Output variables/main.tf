provider "aws" {
  profile = "myaws"
  region = var.region
}

resource "aws_s3_bucket" "bucket2" {
  bucket = var.s3_bucket_name
  acl = var.acl_value

  tags = {
    Name = "My_Bucket"
    Environment = "Dev"
  }
}

