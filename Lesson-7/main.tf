provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "my_web_server" {
  ami                    = "ami-021aaf3749be66813" # Ubuntu server
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_web_server.id]

  tags = {
    Name = "web"
  }
}

resource "aws_security_group" "my_web_server" {
  name = "My security group"

  dynamic "ingress" {
    for_each = ["80", "443", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "My security group"
  }

}




