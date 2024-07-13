# In providers.tf file --> define aws and azure providers

provider "aws" {
  region = "us-east-1"
}

provider "azurerm" {
  subscription_id = "your azure subscription id"
  client_id = "your azure client id"
  client_secret = "your azure client secret"
  tenant_id = "your azure tenant id"
}

# other terraform configuration files, you can then use aws and azurerm
# providers to create resources in AWS and Azure

resource "aws_instance" "example" {
  ami = "ami-xxxxxx"
  instance_type = "t2.micro"
}

resource "azurerm_virtual_machine" "example" {
  name = "example-vm"
  location = "eastus"
  size = "Standard_A1"
}