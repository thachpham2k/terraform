variable "module_name" {
  description = "Name of NAT gateway module. Eg: terraform -> NAT gateway named terraform-natgateway"
  default = "terraform"
}

variable "module_tags" {
  description = "Module tags"
  type        = map(any)
  default = {
    "Project" : "natgateway"
    "author" : "terraform"
  }
}

variable "nat_subnet_id" {
  description = "NAT Gateway locate in this subnet"
}

variable "number_of_prisubnet" {
  type = number
}

variable "privatesubnet" {
  description = "Each subnet in list is associate with NAT gateway (route table). format:`['<subnet_id>',]"
  type = list(string)
}

variable "vpc_id" {
  description = "VPC for NAT gateway"
}