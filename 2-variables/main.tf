provider "aws" {
  region = "eu-west-2"
}

variable "vpcname" {
  type = string
  description = "Enter VPC NAme"
}

variable "sshport" {
  type = number
  default = 22
}

variable "enable" {
  type = bool   
  default = true
  
}

variable "my_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "my-tags" {
  type = list
  default = ["MyVPC", "true"]
}

variable "mymap" {
  type = map
  default = {
    Name ="My_VPC_MAP",
    Date ="9th May 2021"
  }
}
resource "aws_vpc" "my-vpc" {
  cidr_block = var.my_cidr
  tags = {
    "Name" = var.vpcname
    "AutoStartStop" = var.my-tags[1]
    "Date" = var.mymap["Date"]
  }
}

output "vpcid" {
  value = aws_vpc.my-vpc.id
}