resource "aws_subnet" "privatesubnet" {
  availability_zone = tolist(data.aws_availability_zones.availability-zone.names)[count.index]
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index + 1)

  count = length(data.aws_availability_zones.availability-zone.names)

  tags = {
    "Name" = "${var.project-name}-privatesubnet-${count.index}-${tolist(data.aws_availability_zones.availability-zone.names)[count.index]}"
  }
}

resource "aws_subnet" "publicsubnet" {
  availability_zone = tolist(data.aws_availability_zones.availability-zone.names)[count.index]
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index + 100)

  count = length(data.aws_availability_zones.availability-zone.names)

  tags = {
    "Name" = "${var.project-name}-publicsubnet-${count.index}-${tolist(data.aws_availability_zones.availability-zone.names)[count.index]}"
  }
}