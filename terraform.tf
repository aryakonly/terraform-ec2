provider "aws" {
    region = var.region_name
}

resource "aws_instance" "Ec2Instance" {
  #for_each = toset(["instance1", "instance2", "instance3"])
    ami           = var.image
    instance_type = var.instance_type
    # key_name = aws_key_pair.generated.key_name
    key_name = var.key-pair
    # vpc_security_group_ids = [ aws_security_group.my-sg-1.id ]
    vpc_security_group_ids = var.sg
    # count = 3
    # tags = {
    #   Name = "Ec2Instance-${count.index}"
    # }

    user_data = <<-EOF
    #!/bin/bash
    yum install httpd -y
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>This is web-server</h1>" > /var/www/html/index.html
    EOF

    tags = {
      # Name = "Ec2Instance-${count.index + 1}"
      Name = var.instance_name
    }
}
/*
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



data "aws_security_group" "name" {
  name = "my-sg"
  vpc_id = "vpc-0e8c799f8edc4f620"
}

resource "tls_private_key" "algo" {
  algorithm = "RSA"
}
resource "aws_key_pair" "generated" {
  key_name   = "my-mumbai-key"
  public_key = tls_private_key.algo.public_key_openssh
}

resource "local_file" "save" {
  content = tls_private_key.algo.private_key_openssh
  filename = "my-mumbai-key.pem"
}

resource "aws_ebs_volume" "my-volume" {
  availability_zone = "ap-south-1b"
  size = 10
  type = "gp3"

  tags = {
    Name = "my-volume"
  }
}

resource "aws_volume_attachment" "attach" {
  device_name = "/dev/sdf"
  volume_id = aws_ebs_volume.my-volume.id
  instance_id = aws_instance.Ec2Instance.id  
}
*/