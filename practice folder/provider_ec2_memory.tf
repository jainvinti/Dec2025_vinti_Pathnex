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

#-------------------------------------------------------------

provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "FIS_SG" {
    name = "FIS_SG"
    description = "FIS security group"

    ingress = {                   #Inbound rule: who can connect and how.
        from_port = 22
        to_port = 22
        protocol = tcp
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "FIS_ec2" {
    ami = "ajhdflakjhdsf"
    instance_type = "r6i.xlarge"    #r6i.4xlarge (Intel, 16 vCPUs, 128 GiB RAM).

    #vpc_security_group_ids = [aws_security_group.FIS_SG.id] ties the EC2 instance to the security group.
    vpc_security_group_ids = [aws_security_group.FIS_SG.id]

    tags = {
      Name = "FIS_EC2"
    }
}