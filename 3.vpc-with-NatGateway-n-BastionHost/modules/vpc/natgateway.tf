resource "aws_eip" "eip-4natgw" {
  vpc = true
}

resource "aws_nat_gateway" "natgateway" {
  allocation_id = aws_eip.eip-4natgw.id
  subnet_id     = aws_subnet.publicsubnet[0].id

  depends_on = [aws_subnet.publicsubnet[0]]

  tags = {
    "Name" = "${var.project-name}-natgateway"
  }
}