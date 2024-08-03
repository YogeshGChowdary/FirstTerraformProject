variable "bucket_name" {
    type = string
    default = "mybucket89ty45rfd4"
    description = "name of storage account"
}

variable "acl" {
    type = string
    default = "private"

}

variable "region" {    
    default = "us-east-1"
}