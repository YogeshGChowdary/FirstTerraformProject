vpc_cidr = "172.16.0.0/16"

# since vpc_name mentioned as map in variable.tf, so use key value format here
vpc_name = {
    "Name" = "dev_vpc"
  # "Name" = "tf-example"
}

subnet_cidr = "172.16.10.0/24"

#since subnet_name mentioned as map in variable.tf, so use key value format here
subnet_name = {
  #  "Name" = "my_subnet"
     "Name" = "dev_subnet"
}

#since sg_name mentioned as map in variable.tf, so use key value format here
sg_name = {
    "Name" = "allow_tls"
}

/* nic_name = {
  #  "Name" = "my_nic"  # if config/terraform.tfvars command is used, values will be taken from terraform.tfvars
                        # otherwise, values will be taken from default variable.tf... to check that here code is commented
    "Name" = "dev_nic"
} */


# to create multiple resources, below private ips code commented and below new instance_config block added
#private_ips = ["172.16.10.100"]


# to create multiple resources, below instance name code commented and below new instance_config block added

/* instance_name = {
  #  "Name" = "Prod-Server"
    "Name" = "dev-Server"
} */


# to create multiple resources, below instance ami code commented and below new instance_config block added

/* instance_ami = "ami-007855ac798b5175e" */


# to create multiple resources, below instance type code commented and below new instance_config block added
/* instance_type = "t2.micro" */

# to create multiple resources, nic_name code above commented and below new instance_config block added
instance_config = {

    instance_1 = {

        nic_name      = { "Name" = "dev_nic1" }
        private_ips   = ["172.16.10.100"]
        instance_name = { "Name" = "dev-Server1" }
        instance_ami  = "ami-007855ac798b5175e"
        instance_type = "t2.micro"
    }

    instance_2 = {

        nic_name      = { "Name" = "dev_nic2" }
        private_ips   = ["172.16.10.101"]
        instance_name = { "Name" = "dev-Server2" }
        instance_ami  = "ami-007855ac798b5175e"
        instance_type = "t2.micro"

    }
}