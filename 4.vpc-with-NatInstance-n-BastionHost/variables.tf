variable "project-name" {
  default = "VPC-w-natGW-n-BastionHost"
}

variable "vpc-cidr" {
  default = "10.3.0.0/16"
}

variable "private-instance-type" {
  default = "t2.micro"
} 