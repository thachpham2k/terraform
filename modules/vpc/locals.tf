locals {
  validated_nat_az = (var.nat_gateway_az > 0 && var.nat_gateway_az <= var.number_of_az) ? (var.has_public_subnet == true ? var.number_of_az : 0) : 0
}