variable "vpc-cidr" {
  type        = string
  default     = "10.1.0.0/16"
  description = "VPC CIDR"
}

variable "project-name" {
  type        = string
  default     = "terraform-vpc-1zone"
  description = "Name of project"
}

variable "region" {
  default = "ap-southeast-1"
}