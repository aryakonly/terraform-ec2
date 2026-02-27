provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "Ec2Instance" {
  #for_each = toset(["instance1", "instance2", "instance3"])
    ami           = "ami-051a31ab2f4d498f5"
    instance_type = "t3.micro"
    key_name = "mumbai-key"
    security_groups = ["my-sg"]
    count = 3
    # tags = {
    #   Name = "Ec2Instance-${count.index}"
    # }
    tags = {
      Name = "Ec2Instance-${count.index + 1}"
    }
}