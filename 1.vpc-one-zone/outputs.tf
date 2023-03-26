output "vpc-id" {
  value = module.vpc.vpc-id
}

output "privatesubnet-cidr" {
  value = module.vpc.privatesubnet-cidr
}

output "publicsubnet-cidr" {
  value = module.vpc.publicsubnet-cidr
}

output "availabilityzone" {
  value = module.vpc.availabilityzone
}