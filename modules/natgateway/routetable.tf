resource "aws_route_table" "route_table_prisubnet" {
  count = var.number_of_prisubnet

  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgateway.id
  }

  tags = merge({ Name = "${var.module_name}-routetable-4-prisub-${var.privatesubnet[count.index]}" }, var.module_tags)
}

resource "aws_route_table_association" "route_table_association_prisubnet" {
  count = var.number_of_prisubnet

  subnet_id = var.privatesubnet[count.index]

  route_table_id = aws_route_table.route_table_prisubnet[count.index].id
}