variable "public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.

Example: ~/.ssh/terraform.pub
DESCRIPTION
  default     = "terraform-poc01.pub"
}

#variable "key_name" {
#  description = "Desired name of AWS key pair"
#  default     = "terraform-poc01"
#}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-1"
}

# Ubuntu Precise 12.04 LTS (x64)
variable "aws_amis" {
  default = {
    eu-west-1 = "ami-674cbc1e"
    us-east-1 = "ami-1d4e7a66"
    us-west-1 = "ami-969ab1f6"
    us-west-2 = "ami-8803e0f0"
  }
}

variable "sample" {
  default = "demo"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "environment" {}

variable "vpc_id" {}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "route_table_id" {}

variable "ig_id" {}

variable "instance_type" {
  default = "t2.micro"
}
variable "subnet_id" {}

variable "vpc_security_group_ids" {}

#variable "key_id" {}
