provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "Ec2Instance" {
  #for_each = toset(["instance1", "instance2", "instance3"])
    ami           = "ami-051a31ab2f4d498f5"
    instance_type = "t3.micro"
    key_name = "mumbai-key"
    vpc_security_group_ids = [ aws_security_group.my-sg-1.id ]
    # count = 3
    # tags = {
    #   Name = "Ec2Instance-${count.index}"
    # }
    tags = {
      # Name = "Ec2Instance-${count.index + 1}"
      Name = "Ec2Instance"
    }
}
resource "aws_security_group" "my-sg-1" {
  name        = "my-sg-1"
  description = "Allow SSH , HTTP and HTTPS traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}