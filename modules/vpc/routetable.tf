# RouteTable for private subnet
resource "aws_route_table" "prisub_routetable" {
  count = length(aws_subnet.privatesubnet)

  vpc_id = aws_vpc.vpc.id

  tags = merge({ Name = "${var.module_name}-routetable-for-prisubnet-${count.index + 1}" }, var.module_tags)
}

resource "aws_route_table_association" "prisub_routetable_association" {
  count = length(aws_subnet.privatesubnet)

  subnet_id      = aws_subnet.privatesubnet[count.index].id
  route_table_id = aws_route_table.prisub_routetable[count.index].id
}
# RouteTable for public subnet
resource "aws_route_table" "pubsub_routetable" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = merge({ Name = "${var.module_name}-routetable-for-pubsubnet" }, var.module_tags)
}

resource "aws_route_table_association" "route-table-association-publicsubnet" {
  count = length(aws_subnet.publicsubnet)

  subnet_id      = aws_subnet.publicsubnet[count.index].id
  route_table_id = aws_route_table.pubsub_routetable.id
}