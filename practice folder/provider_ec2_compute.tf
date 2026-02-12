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