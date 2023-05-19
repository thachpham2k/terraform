resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_nat_gateway" "natgateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = var.nat_subnet_id

  tags = merge({ Name = "${var.module_name}-natgateway"}, var.module_tags)
}