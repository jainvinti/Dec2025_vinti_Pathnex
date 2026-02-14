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
  key_name = aws_key_pair.vinti_key.key_name

  tags = {
    Name = "vinti-EC2"
  }
}