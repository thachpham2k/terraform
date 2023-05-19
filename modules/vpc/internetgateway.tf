resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = merge({ Name = "${var.module_name}-igw" }, var.module_tags)
}