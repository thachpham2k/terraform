output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "privatesubnet_cidr" {
  value = tolist(aws_subnet.privatesubnet)[*].cidr_block
}

output "publicsubnet_cidr" {
  value = tolist(aws_subnet.publicsubnet)[*].cidr_block
}

output "availabilityzone" {
  value = data.aws_availability_zones.availability_zone.names
}