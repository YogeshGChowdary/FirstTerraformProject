output "jenkins_url" {
  value = join ("", ["http://", aws_instance.jenkins_server.public_dns, ":", "8080"])
}

/* // functions are used here, first comma "," is separator 
   and inside this it should output in this format of https 
   public dns from instance is required and colon is added followed by port 8080 //
   This will output our url, using which we can directly go jenkins dashboard*/