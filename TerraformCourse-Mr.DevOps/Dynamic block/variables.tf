variable "aws_sg" {
  type = map(object({
    description = string
    port = number
    protocol = string
    cidr_blocks = list(string)
  }))
  default = {
    "80" = {
        cidr_blocks = ["0.0.0.0/0"]
        description = "tls_rule1"
        port = 80
        protocol = "tcp"      
    }

    "443" = {
        cidr_blocks = ["0.0.0.0/0"]
        description = "tls_rule2"
        port = 443
        protocol = "tcp"
  }
}
}