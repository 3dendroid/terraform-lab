#!/bin/bash
sudo apt update -y
sudo apt install nginx -y

cat <<EOF > /var/www/html/index.html
<html>

  <h1>Welcome to my Web Server on Amazon EC2<font color="red"> v.10.2 </font></h1> <br>
  Owner ${f_name} ${l_name} <br>
  <p>First Name: ${f_name}</p>
  <p>Last Name: ${l_name}</p>
  %{ for x in names ~}
  Hello for ${x} from ${f_name} <br>
  %{ endfor ~}

</html>
EOF
