provider  "aws" {
    profile = "myaws"
    region = var.region    
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

/* resource "aws_s3_bucket_acl" "acl" {
  depends_on = [aws_s3_bucket.bucket]
  bucket = var.s3_bucket_name
  acl    = var.acl_value
} */

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.bucket.bucket
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.bucket
  acl    = "private"
}

