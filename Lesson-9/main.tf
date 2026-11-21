provider "aws" {}

data "aws_availability_zones" "working" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_vpc" "db_vpc" {
  tags = {
    Name = "web"
  }
}

resource "aws_subnet" "web_subnet_1" {
  vpc_id            = data.aws_vpc.db_vpc.id
  availability_zone = data.aws_availability_zones.working.names[0]
  cidr_block        = "172.31.0.0/20"

  tags = {
    Name    = "Subnet-1 in ${data.aws_availability_zones.working.names[0]}"
    Account = "Subnet-1 in account ${data.aws_caller_identity.current.account_id}"
    Region  = data.aws_region.current.description
  }
}

resource "aws_subnet" "web_subnet_2" {
  vpc_id            = data.aws_vpc.db_vpc.id
  availability_zone = data.aws_availability_zones.working.names[1]
  cidr_block        = "172.31.0.0/16"

  tags = {
    Name    = "Subnet-2 in ${data.aws_availability_zones.working.names[1]}"
    Account = "Subnet-2 in account ${data.aws_caller_identity.current.account_id}"
    Region  = data.aws_region.current.description
  }
}


output "vpc_id" {
  value = data.aws_vpc.db_vpc.id
}

output "vpc_cidr" {
  value = data.aws_vpc.db_vpc.cidr_block
}

output "aws_availability_zones" {
  value = data.aws_availability_zones.working.names[1]
}

output "aws_caller_identity" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_region_name" {
  value = data.aws_region.current.region
}

output "aws_region_description" {
  value = data.aws_region.current.description
}
