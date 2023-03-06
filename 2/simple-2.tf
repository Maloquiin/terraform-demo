# Build WebServer

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "webserver" {
  ami = "ami-0c0933ae5caf0f5f9"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.security_group.id]
  user_data = <<EOF
#! /bin/bash
yum -y update
yum -y install httpd
myip=`localhost`
echo "<h2>WebServer with IP; $myip</h2><br>Build by Terraform!" > /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
EOF
}

resource "aws_security_group" "security_group" {
  name        = "webserver_security2"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
