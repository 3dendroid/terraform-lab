#!/bin/bash
apt update -y
apt install nginx -y

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>My Web Server</title>
</head>
<body>
  <h2>AMAZON WEB SERVER <font color="blue">v.22.2</font></h2>
  <p>Owner: ${f_name} ${l_name}</p>
  <p>First Name: ${f_name}</p>
  <p>Last Name: ${l_name}</p>
%{ for x in names ~}
  Hello for ${x} from ${f_name}<br>
%{ endfor ~}
</body>
</html>
EOF