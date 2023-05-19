resource "aws_subnet" "privatesubnet" {
  count = var.has_private_subnet ? var.number_of_az : 0

  availability_zone = tolist(data.aws_availability_zones.availability_zone.names)[count.index]
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index + 1)

  depends_on = [
    aws_vpc.vpc
  ]

  tags = merge({ Name = "${var.module_name}-privatesubnet-${count.index + 1}-${tolist(data.aws_availability_zones.availability_zone.names)[count.index]}" }, var.module_tags)
}

resource "aws_subnet" "publicsubnet" {
  count = var.has_public_subnet ? var.number_of_az : 0

  availability_zone = tolist(data.aws_availability_zones.availability_zone.names)[count.index]
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index + 100)

  depends_on = [
    aws_vpc.vpc
  ]

  tags = merge({ Name = "${var.module_name}-publicsubnet-${count.index + 1}-${tolist(data.aws_availability_zones.availability_zone.names)[count.index]}" }, var.module_tags)
}