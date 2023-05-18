variable "vpc-cidr" {
  type        = string
  default     = "10.2.0.0/16"
  description = "VPC CIDR"
}

variable "project-name" {
  type        = string
  default     = "terraform-vpc-2zone"
  description = "Name of project"
}

variable "region" {
  default = "ap-southeast-1"
}