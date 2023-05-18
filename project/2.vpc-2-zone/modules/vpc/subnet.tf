resource "aws_subnet" "privatesubnet" {
  availability_zone = tolist(data.aws_availability_zones.availability-zone.names)[count.index]
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index + 1)

  count = local.counts

  depends_on = [
    aws_vpc.vpc
  ]

  tags = {
    Name = "${var.project-name}-privatesubnet-${count.index}-${tolist(data.aws_availability_zones.availability-zone.names)[count.index]}"
  }
}

resource "aws_subnet" "publicsubnet" {
  for_each = local.public-subnet-name

  availability_zone = tolist(data.aws_availability_zones.availability-zone.names)[each.value]
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, each.value + 100)

  depends_on = [
    aws_vpc.vpc
  ]

  tags = {
    Name = "${var.project-name}-${each.key}-${tolist(data.aws_availability_zones.availability-zone.names)[each.value]}"
  }
}