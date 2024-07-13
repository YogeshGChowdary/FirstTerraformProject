module "aws_vpc" {
  source = "./aws_vpc"
  providers = {
    aws = aws.us-west-2
  }
}

resource "aws_instance" "example" {
  ami = "ami-xxxxxx"
  instance_type = "t2.micro"
  depends_on = [ module.aws_vpc ]
}