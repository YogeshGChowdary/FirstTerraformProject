output "name_of_storage_account" {
  value = aws_s3_bucket.bucket2.bucket
}

output "acl_value" {
  value = aws_s3_bucket.bucket2.acl
}

output "tags" {
  value = aws_s3_bucket.bucket2.tags
}