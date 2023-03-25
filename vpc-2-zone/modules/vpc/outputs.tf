output "vpc-id" {
  value = aws_vpc.vpc.id
}

output "privatesubnet-cidr" {
  value = tolist(aws_subnet.privatesubnet)[*].cidr_block
}

output "publicsubnet-cidr" {
  value = [for s in aws_subnet.publicsubnet : s.cidr_block[*]]
}

output "availabilityzone" {
  value = tolist(data.aws_availability_zones.availability-zone.names)
}