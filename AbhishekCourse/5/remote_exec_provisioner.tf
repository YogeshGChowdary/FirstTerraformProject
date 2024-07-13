# "remote-exec" provisioner is used to run scripts or commands on a remote machine over SSH or WinRM connections. It's often used to configure or install software on provisioned instances

resource "aws_instance" "example" {
  ami = "ami-xxxxxx"
  instance_type = "t2.micro"

  provisioner "remote-exec" {
    inline = [ 
        "sudo yum update -y",
        "sudo yum install -y httpd",
        "sudo systemctl start httpd"
     ]

     connection {
       host = aws_instance.example.public_ip
       type = "ssh"
       private_key = file("~/.ssh/id-rsa")
       user = "ec2-user"
     }
  }
}