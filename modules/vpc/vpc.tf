resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags       = merge({ Name = "${var.module_name}-vpc" }, var.module_tags)
}