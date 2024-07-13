# "file" provisioner is used to copy files or directories from local machine to remote machine. This is useful for deploying configuration files, scripts or other assets to a provisioned instance


resource "aws_instance" "example" {
  ami = "ami-xxxxxxxxx"
  instance_type = "t2.micro"

provisioner "file" {
    source = "mention local file path to copy file local.txt"
    destination = "path on remote instance to paste file local.txt"

    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("~/.ssh/id_rsa")
        host = aws_instance.example.public_ip
        }
    }
}