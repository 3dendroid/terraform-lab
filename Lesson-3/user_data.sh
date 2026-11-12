#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
echo "<h1>Welcome to my Web Server on Amazon EC2</h1>" | sudo tee /var/www/html/index.html