# AWS Network Interface attached to AWS Instance

resource "aws_network_interface" "foo" {
  subnet_id       = var.subnet_id
  private_ips     = var.private_ips

  tags = var.nic_name
}


