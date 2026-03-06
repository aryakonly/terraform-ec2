output "public-ip" {
  value = aws_instance.Ec2Instance.public_ip
}