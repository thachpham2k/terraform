output "vpc-id" {
  value = aws_vpc.vpc.id
}

output "privatesubnet0-id" {
  value = aws_subnet.privatesubnet[0].id
}

output "publicsubnet0-id" {
  value = aws_subnet.publicsubnet[0].id
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

output "internetgateway" {
  value = aws_internet_gateway.internet-gateway.id
}

output "eip-ip" {
  value = aws_eip.eip-4natgw.public_ip
}