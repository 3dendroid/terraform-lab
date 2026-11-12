provider "aws" {
  region = "eu-north-1"
}

resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_web_server.id
}

resource "aws_instance" "my_web_server" {
  ami                    = "ami-021aaf3749be66813" # Ubuntu server
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_web_server.id]
  # user_data_replace_on_change = true
  user_data = templatefile("user_data.sh.tpl", {
    f_name = "Denis"
    l_name = "Sazonov"
    names  = ["Denis", "Vasya", "Anna", "Petya", "John", "Donald", "Igor", "Misha", "July"]
  })

  tags = {
    Name  = "My Web Server on AWS EC2"
    Owner = "Denis Sazonov"
  }

  lifecycle {
    create_before_destroy = true
    ### prevent_destroy = true
    ### ignore_changes = ["ami", user_data]
  }
}



resource "aws_security_group" "my_web_server" {
  name        = "Webserver security group"
  description = "First security group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
