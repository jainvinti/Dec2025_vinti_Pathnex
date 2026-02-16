provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "vintiEC2" {
    ami = "ami-0asdhfluuD"
    instance_type = "c5.xlarge"

    tags = {
        Name = "vinti-EC2"
    }
}


#-------------------------------------------------------------

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "vinti_key" {
  key_name = "Vinti_Key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDf8s"
}

resource "aws_instance" "vinti_ec2" {
  ami = "ami-0asdhfluuD"
  instance_type = "c5.xlarge"
  
  user_data = <<EOF
  #!/bin/bash
  yum install -y httpd
  systemctl start httpd
  EOF

  key_name = aws_key_pair.vinti_key.key_name

  tags = {
    Name = "vinti-EC2"
  }
}

#-------------------------------------------------------------

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vintiVPC" {
    cidr_block = "10.0.0.1/16"

    tags = {
        Name = "vinti-VPC"
    }
}

resource "aws_subnet" "vintiSubnet" {
    vpc_id = aws_vpc.vintiVPC.id
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = true

    tags ={
        Name = "vinti-subnet"
    }
}

resource "aws_internet_gateway" "vintiIGW" {
    vpc_id = aws_vpc.vintiVPC.id

    tags = {
        Name = "vinti_IGW"
    }
}

resource "aws_route_table" "vintiRoute" {
  vpc_id = aws_vpc.vintiVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vintiIGW.id
  }

  tags = {
    Name = vinti-Routetable
  }
}

resource "aws_route_table_association" "vintiRTA" {
    subnet_id = aws_subnet.vintiSubnet.id
    route_table_id = aws_route_table.vintiRoute.id
}