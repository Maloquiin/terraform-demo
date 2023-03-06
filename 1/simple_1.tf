provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my_ubuntu" {
  ami = "ami-0d1ddd83282187d18"
  instance_type = "t2.micro"
  count = 3
  tags = {
    Name = "My Amazon Server"
    Owner = "Nikolai Markov"
    Project = "terraform"
  }
}

resource "aws_instance" "my_amazonlinux" {
  ami = "ami-0c0933ae5caf0f5f9"
  instance_type = "t2.micro"
  
    tags = {
    Name = "My Amazon Server"
    Owner = "Nikolai Markov"
    Project = "terraform"
  }
}