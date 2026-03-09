variable "region_name" {
  default = "ap-south-1"
}
variable "image" {
    default = "ami-051a31ab2f4d498f5"
  
}
variable "instance_type" {
  default = "t3.micro"
}
variable "instance_name" {
  default = "static-webiste"
}

variable "sg" {
  default = ["sg-0002f6ecceaad3bdc"]
}

variable "key-pair" {
  default = "mumbai-key"
}