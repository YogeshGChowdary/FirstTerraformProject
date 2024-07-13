# Root level Input variable

variable "instance_type" {
  description = "#mention type of ec2 instance to launch#"
  type = string
  default = "## mention default value"
}
   
#    # you can then use int input variable with your module or configuration like 
#    this

resource "example_resource" "example" {
  name = var.instance_type
}

#Output variables

output "example_output" {
  description = "an example output variable"
  value = resource.example_resource.example.id
}

# Module level input variable

module "ec2_instance" {
  source = "./modules/ec2_instance"
  instance_type = var.instance_type
}

#You can reference output variables in the root module or in other modules by using the syntax module.module_name.output_name, where module_name is the name of the module containing the output variable.

# For example, if you have an output variable named example_output in a module called example_module, you can access it in the root module like this:

output "root_output" {
  value = module.example_module.example_output
}

#example

output "public_ip" {
  value = aws_instance.example.public_ip
}