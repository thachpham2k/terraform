resource "aws_subnet" "privatesubnet" {
  availability_zone = tolist(data.aws_availability_zones.availability-zone.names)[0]
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 1)

  depends_on = [
    aws_vpc.vpc
  ]

  tags = {
    Name = "${var.project-name}-privatesubnet-${tolist(data.aws_availability_zones.availability-zone.names)[0]}"
  }
}

resource "aws_subnet" "publicsubnet" {
  availability_zone = tolist(data.aws_availability_zones.availability-zone.names)[0]
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 100)

  depends_on = [
    aws_vpc.vpc
  ]

  tags = {
    Name = "${var.project-name}-publicsubnet-${tolist(data.aws_availability_zones.availability-zone.names)[0]}"
  }
}