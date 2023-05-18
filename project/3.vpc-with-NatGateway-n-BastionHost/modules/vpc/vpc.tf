resource "aws_vpc" "vpc" {
  cidr_block = var.vpc-cidr

  tags = {
    "Name" = "${var.project-name}-vpc"
  }
}
