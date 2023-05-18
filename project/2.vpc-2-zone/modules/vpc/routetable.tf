resource "aws_route_table" "route-table-privatesubnet" {
  vpc_id = aws_vpc.vpc.id

  count = length(aws_subnet.privatesubnet)

  tags = {
    "Name" = "${var.project-name}-routetable-${count.index}-for-privatesubnet"
  }
}

resource "aws_route_table_association" "route-table-association-privatesubnet" {
  count = length(aws_subnet.privatesubnet)

  subnet_id = aws_subnet.privatesubnet[count.index].id

  route_table_id = aws_route_table.route-table-privatesubnet[count.index].id
}

resource "aws_route_table" "route-table-publicsubnet" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
  tags = {
    "Name" = "${var.project-name}-routetable-for-publicsubnet"
  }
}
resource "aws_route_table_association" "route-table-association-publicsubnet" {
  for_each = { for k, v in aws_subnet.publicsubnet : k => v }

  subnet_id      = each.value.id
  route_table_id = aws_route_table.route-table-publicsubnet.id
}