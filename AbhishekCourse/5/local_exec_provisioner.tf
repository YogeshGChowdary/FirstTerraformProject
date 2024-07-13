# "local-exec" provisioner is used to run scripts or commands locally on the machine where terraform is executed. it is useful for tasks that dont require remote execution, such as initializing a local database or configuring local resources

resource "null_resource" "example" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo 'This is a local command'"
  }
}