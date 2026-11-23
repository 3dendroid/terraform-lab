provider "aws" {
  region = var.region
  #eu-north-1"
}

data "aws_ami" "latest_ubuntu" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-resolute-26.04-amd64-server-*"]
  }
}


resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_server.id

  tags = merge(var.common_tags, { Name : "Server IP" })
  #   tags = {
  #     Name    = "Server IP"
  #     Owner   = "Denis Sazonov"
  #     Project = "Phoenix"
  #     Region  = var.region
  #   }
}

resource "aws_instance" "my_server" {
  ami                    = "ami-021aaf3749be66813" # Ubuntu server
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_server.id]
  monitoring             = var.detailed_monitoring

  tags = merge(var.common_tags, { Name : "Server build by Terraform" })
  #   tags = {
  #     Name    = "Server build by Terraform"
  #     Owner   = "Denis Sazonov"
  #     Project = "Phoenix"
  #     Region  = var.region
  #   }

}

resource "aws_security_group" "my_server" {
  name = "My security group"

  dynamic "ingress" {
    for_each = var.allowed_ports
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
  tags = merge(var.common_tags, { Name : "Server security group" })
  #   tags = {
  #     Name    = "Server security group"
  #     Owner   = "Denis Sazonov"
  #     Project = "Phoenix"
  #     Region  = var.region
  #   }

}


