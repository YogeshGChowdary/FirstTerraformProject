module "vpc" {
  source = "./modules/aws_vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "subnet" {
  source = "./modules/aws_subnet"
  vpc_id =  module.vpc.vpc_id
  subnet_cidr = var.subnet_cidr
  subnet_name = var.subnet_name
}

module "sg" {
  source = "./modules/aws_SG"
  vpc_id = module.vpc.vpc_id
  sg_name = var.sg_name
}

module "nic" {
  source = "./modules/aws_NIC"
  for_each     = var.instance_config
  subnet_id    = module.subnet.subnet_id

  /* nic_name     = var.nic_name */ # commented since multiple resources concept added in terraform.tfvars
  nic_name     = each.value.nic_name

  /* private_ips  = var.private_ips */  # commented since multiple resources concept added in terraform.tfvars
  private_ips = each.value.private_ips
}

module "instance" {

  source            = "./modules/aws_ec2"

  # depends on argument used, since instance create will wait till nic is returning the value
  depends_on = [ 
    module.nic
   ]

  for_each          = var.instance_config

  /* instance_name     = var.instance_name */ # commented since multiple resources concept added in terraform.tfvars
  
  instance_name     = each.value.instance_name

  /* instance_ami      = var.instance_ami */
  instance_ami      = each.value.instance_ami

  /* instance_type     = var.instance_type */
  instance_type     = each.value.instance_type


  /* nic_id            = module.nic.nic_id */ # nic id means two times it should return
                                              # by adding [each.key], this ece instance will take zeroth id of the nic first
                                              # then it goes for second name.. since we passed two nic ids
  nic_id            = module.nic[each.key].nic_id


}

# below commented code for alias concept, creating resource using multiple providers

/* module "instance_east_2" {
  source = "./modules/aws_ec2"
  providers = {
    aws = aws.east-2
  }
  instance_name     = var.instance_name
  instance_ami      = var.instance_ami
  instance_type     = var.instance_type
  nic_id            = module.nic.nic_id
} */