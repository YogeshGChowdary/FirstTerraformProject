provider "aws" {
  region = var.region
  access_key =  var.access_key
  secret_key =  var.secret_key
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

data "aws_availability_zones" "available" {

}

resource "aws_default_subnet" "default_az1" {
  availability_zone = data.aws_availability_zones.available.names[0]   #we defined region as us-east-1 and it has three avaialbility zones
                                                                       # and we want to vpc on first AZ, so index 0 is given for us-east-1a

  tags = {
    Name = "Default subnet for us-west-1a"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow 8080 and 22 inbound traffic"
  vpc_id      = aws_default_vpc.default.id
  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

# Instead of hard coding values for each port, we can use dynamic block concept here
# Refer to code in course folder for usage of dynamic block for ingress and egress

  ingress {
    description      = "HTTP access"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_instance" "jenkins_server" {
  ami                       = "ami-007855ac798b5175e"
  instance_type             = "t2.micro"
  subnet_id                 = aws_default_subnet.default_az1.id
  vpc_security_group_ids    = [aws_security_group.allow_tls.id]
  key_name                  = "EC2KeyPair"    # key pair .pem file to ssh into ec2 instance

  tags = {
    "Name" = "Jenkins_server"
  }
}

# we use variablize all values here, due to time constraint not doing it.. pls try yourself


resource "null_resource" "name" {
  
  # SSH into EC2 Instance

  connection {
    
    type = "ssh"
    user = "ubuntu"
    private_key = file("~/Downloads/EC2KeyPair.pem")   # give path of pem file in local system
    host = aws_instance.jenkins_server.public_ip    # using public ip we will access the instance, give instance public ip

  }


# copy the install_jenkins.sh file from local to ec2 instance

provisioner "file" {

    source = "install_jenkins.sh"               # give source file location, since it is in present folder, only name of file mentioned
    destination = "/tmp/install_jenkins.sh"     # give path where you want to copy the file

}

# set permission and execute the install_jenkins.sh file

provisioner "remote-exec" {

    inline = [
        "sudo chmod +x /tmp/install_jenkins.sh",    # mention comma , here as line breaker, otherwise it will throw error
        "sh /tmp/install_jenkins.sh"

    ]

}

depends_on = [
    aws_instance.jenkins_server  # once ec2 instance created then only it should execute, so depends on block added
]

}