#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "Welcome to Terraform Web App - $(hostname)" | sudo tee /var/www/html/index.html
