# syntax

# condition ? true_val : false_val

variable "create_instance" {
  description = "A boolean flag to determine whether to create the AWS instance"
  type = bool
  default = true
}

resource "aws_instance" "example" {
  count = var.create_instance ? 1 : 0

  ami = "ami-xxxxxxx"
  instance_type = "t2.micro"
}
# ----------------------------------------------------------------

# conditional variable assignment example

variable "environment" {
  description = "Environment type"
  type = string
  default = "development"
}

variable "production_subnet_cidr" {
  description = "CIDR block for production subnet"
  type = string
  default = "10.0.1.0/24"
}

variable "development_subnet_cidr" {
  description = "CIDR block for development subnet"
  type = string
  default = "10.0.2.0/24"
}

resource "aws_security_group" "example" {
  name = "example-sg"
  description = "example security group"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.environment == "production" ? [var.production_subnet_cidr] : [var.development_subnet_cidr]
  }
}

# ---------------------------------------------------------------------------------

# conditional resource configuration

variable "enable_ssh" {
  description = "To enable SSH"
  type = bool
  default = true
}

resource "aws_security_group" "example" {
  name = "example-sg"
  description = "Example security group"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.enable_ssh ? ["0.0.0.0/0"] : []
  }
}

   #In this example, the ingress block within the aws_security_group resource uses a conditional expression to control whether SSH access is allowed. If enable_ssh is true, it allows SSH traffic from any source ("0.0.0.0/0"); otherwise, it allows no inbound traffic.


