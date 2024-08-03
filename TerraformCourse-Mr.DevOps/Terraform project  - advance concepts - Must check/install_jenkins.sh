# #!/bin/bash

# sudo apt update -y

# sudo apt install default-jre -y

# java -version

# sudo apt update -y

# wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

# sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# sudo apt update -y

# sudo add-apt-repository universe -y

# sudo apt-get install jenkins -y

# sudo systemctl enable jenkins

# sudo systemctl start jenkins 

# cat /var/lib/jenkins/secrets/initialAdminPassword


# #!/bin/bash

# sudo apt update -y

# sudo apt install default-jre -y

# java -version

# sudo apt update -y

# wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

# sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# sudo apt update -y

# sudo add-apt-repository universe -y

# sudo apt-get install jenkins -y

# sudo service jenkins start

# cat /var/lib/jenkins/secrets/initialAdminPassword




curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y

cat /var/lib/jenkins/secrets/initialAdminPassword