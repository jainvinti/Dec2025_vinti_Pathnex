provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2_instance" {
    ami = "sdjkhfasdfgar"
    instance_type = "r5.2xlarge"

    tags = {
        Name = "EC2_mem"
        Owner = "vinti"
    }
}