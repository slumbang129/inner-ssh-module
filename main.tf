# Specify the provider and access details
provider "aws" {
  region = var.aws_region
}

# Create a VPC to launch our instances into
resource "aws_vpc" "drift_root_vpc" {
  cidr_block = var.cidr_block
 
}

resource "aws_subnet" "drift_web_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  
}

resource "aws_internet_gateway" "drift_root_ig" {
  vpc_id = var.vpc_id
  
}

resource "aws_route" "drift_root_route" {
  route_table_id         = var.route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.ig_id
}

#resource "aws_key_pair" "auth" {
#  key_name   = var.key_name
#  public_key = file(var.public_key_path)
#}

# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "drift_web_sg" {
  name        = "drift_web"
  description = "Used in the terraform"
  vpc_id      = var.vpc_id

 

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  # HTTP access from the VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    to_port     = 3306
    from_port   = 3306
    protocol    = "tcp"
    cidr_blocks = ["192.164.0.0/24"]
  }

  ingress {
    to_port     = 137
    from_port   = 137
    protocol    = "tcp"
    cidr_blocks = ["192.164.0.0/24"]
  }

  ingress {
    to_port     = 9090
    from_port   = 9090
    protocol    = "tcp"
    cidr_blocks = ["192.164.0.0/24"]
  }

  ingress {
    to_port     = 3389
    from_port   = 3389
    protocol    = "tcp"
    cidr_blocks = ["192.164.0.0/24"]
  }

  ingress {
    to_port     = 9042
    from_port   = 9042
    protocol    = "tcp"
    cidr_blocks = ["192.164.0.0/24"]
  }

  ingress {
    to_port     = 7000
    from_port   = 7000
    protocol    = "tcp"
    cidr_blocks = ["192.164.0.0/24"]
  }

  ingress {
    to_port     = 7199
    from_port   = 7199
    protocol    = "tcp"
    cidr_blocks = ["192.164.0.0/24"]
  }

  ingress {
    to_port     = 61620
    from_port   = 61620
    protocol    = "tcp"
    cidr_blocks = ["192.164.0.0/24"]
  }

  ingress {
    to_port     = 8888
    from_port   = 8888
    protocol    = "tcp"
    cidr_blocks = ["192.164.0.0/24"]
  }

  ingress {
    to_port     = 9160
    from_port   = 9160
    protocol    = "tcp"
    cidr_blocks = ["192.164.0.0/24"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "drift_web-instance" {
  # The connection block tells our provisioner how to
  # communicate with the resource (instance)
  connection {
    # The default username for our AMI
    user = "ubuntu"
    host = "drift"
    # The connection will use the local SSH agent for authentication.
  }

 tags = {
    Owner = "Nitin More"
  }

  instance_type = var.instance_type

  # Lookup the correct AMI based on the region
  # we specified
  ami = lookup(var.aws_amis, var.aws_region)

  # The name of our SSH keypair we created above.
  #key_name = var.key_id

  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = [var.vpc_security_group_ids]

  subnet_id = var.subnet_id

  
}
