output "vpc-id" {
  value = aws_vpc.vpc.id
}

output "privatesubnet-cidr" {
  value = aws_subnet.privatesubnet.cidr_block
}

output "publicsubnet-cidr" {
  value = aws_subnet.publicsubnet.cidr_block
}

output "availabilityzone" {
  value = data.aws_availability_zones.availability-zone.names[0]
}