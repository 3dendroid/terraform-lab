variable "region" {
  description = "Please enter the AWS region"
  type        = string
  default     = "eu-north-1"
}


variable "instance_type" {
  description = "Enter instance type"
  type        = string
  default     = "t3.micro"
}

variable "allowed_ports" {
  description = "List of ports to open for server"
  default     = ["443", "80", "22"]
}


variable "detailed_monitoring" {
  description = "Enable detailed monitoring"
  type        = bool
  default     = "true"
}

variable "common_tags" {
  description = "Common tags to apply to all resourses"
  type        = map(any)
  default = {
    Owner       = "Denis Sazonov"
    Project     = "Phoenix"
    Environment = "Production"
    CostCenter  = "888"
  }

}
