#!/bin/bash
        sudo apt install nginx -y
        sudo apt install git -y
        sudo git clone https://github.com/saikiranpi/Website_testing.git
        sudo rm -rf /var/www/html/index.nginx-debian.html
        sudo cp Website_testing/index.html /var/www/html/index.nginx-debian.html
        sudo cp Website_testing/css/style.css /var/www/html/style.css
        sudo cp Website_testing/js/custom.js /var/www/html/scorekeeper.js
  	#echo "<div><h1>${var.vpc_name}-Private-Server-${count.index + 1}</h1></div>" >> /var/www/html/index.nginx-debian.html
    sed -i '29i <center><div id="container"><h1>${var.vpc_name}-Private-Server-${count.index + 1}</h1></div></center>' /var/www/html/index.nginx-debian.html