variable "region" {
    type = string
    default = "us-east-1"
    description = "location"
}

variable "s3_bucket_name" {
  type = string
  description = "name of bucket"
  default = "testingbucket134223"
}


variable "acl_value" {
    description = "type of acl to apply like private, public-read, public write"
    default = "private"
}

