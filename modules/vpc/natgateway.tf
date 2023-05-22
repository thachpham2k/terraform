resource "aws_eip" "eip" {
  count = (local.validated_nat_az > 0 && var.has_nat_gateway == true) ? 1 : 0
  vpc   = true
}

resource "aws_nat_gateway" "natgateway" {
  count = (local.validated_nat_az > 0 && var.has_nat_gateway == true) ? 1 : 0

  allocation_id = aws_eip.eip[0].id
  subnet_id     = aws_subnet.publicsubnet[var.nat_gateway_az - 1].id

  tags = merge({ Name = "${var.module_name}-natgateway" }, var.module_tags)
}