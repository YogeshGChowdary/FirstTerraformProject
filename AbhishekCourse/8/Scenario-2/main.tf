resource "aws_instance" "test_drift" {
  ami = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  tags = {
    Name = "web-app"
    Kind = "httpd-server"
  }
}

