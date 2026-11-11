provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "Ubuntu_server" {
  count         = 1
  ami           = "ami-021aaf3749be66813"
  instance_type = "t3.micro"

  tags = {
    Name : "Ubuntu Server"
    Owner : "Denis Sazonov"
    Project : "Terraform Lesson"
  }
}

resource "aws_instance" "Amazon_server" {
  count         = 1
  ami           = "ami-04005916a1c241ff5"
  instance_type = "t3.micro"

  tags = {
    Name : "Amazon Server"
    Owner : "Denis Sazonov"
    Project : "Terraform Lesson"
  }
}
