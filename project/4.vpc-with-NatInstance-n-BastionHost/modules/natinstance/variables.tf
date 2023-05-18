variable "vpc-id" {
}

variable "natintance-subnet-id" {
}

variable "private-subnet" {
  type = list(any)
}

variable "project-name" {
  default = "terraform"
}