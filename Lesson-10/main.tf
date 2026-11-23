## FIND LATEST UBUNTU AMI


provider "aws" {
  region = "eu-north-1"
}


data "aws_ami" "latest_ubuntu" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-resolute-26.04-amd64-server-*"]
  }
}

output "ubuntu_ami_id" {
  value = data.aws_ami.latest_ubuntu.id
}

output "ubuntu_ami_name" {
  value = data.aws_ami.latest_ubuntu.name
}

