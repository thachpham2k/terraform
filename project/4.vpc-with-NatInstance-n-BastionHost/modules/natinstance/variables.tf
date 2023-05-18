variable "vpc-id" {
}

variable "natintance-subnet-id" {
}

variable "private-subnet" {
    type = list
}

variable "project-name" {
  default = "terraform"
}