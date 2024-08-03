
provider "aws" {
    profile = "myaws"
    region = var.region
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "bucket" {
    bucket = var.bucket_name
    acl =   var.acl
}

