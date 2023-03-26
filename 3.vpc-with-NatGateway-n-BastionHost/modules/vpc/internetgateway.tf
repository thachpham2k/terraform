resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = "${var.project-name}-internetgateway-${aws_vpc.vpc.id}"
  }
}