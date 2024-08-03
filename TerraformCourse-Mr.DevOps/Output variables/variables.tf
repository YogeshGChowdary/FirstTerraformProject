variable "region" {
  default = "us-east-1"
}

variable "s3_bucket_name" {
  default = "dummycheckingbucket"
  type = string
  description = "s3 bucket name"
}

variable "acl_value" {
    type = string
    default = "private"
}