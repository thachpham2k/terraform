output "vpc_id" {
  value = module.vpc.vpc_id
}

output "privatesubnet" {
  value = module.vpc.privatesubnet
}

output "publicsubnet" {
  value = module.vpc.publicsubnet
}

output "availabilityzone" {
  value = module.vpc.availabilityzone
}

output "internetgateway" {
  value = module.vpc.internetgateway
}

output "eip-natgw-publicip" {
  value = module.vpc.eip-natgw-publicip
}