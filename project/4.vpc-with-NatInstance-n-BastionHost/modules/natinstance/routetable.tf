resource "aws_route_table" "privateroutetable" {
  vpc_id = var.vpc-id
  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = aws_instance.natinstance.id
  }
  tags = {
    "Name" = "${var.project-name}-private-subnet-routetable"
  }
}

resource "aws_route_table_association" "routetablenatgatway" {
  for_each = { for k, v in var.private-subnet : k => v }

  subnet_id      = each.value.id
  route_table_id = aws_route_table.privateroutetable.id
}