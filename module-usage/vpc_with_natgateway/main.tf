module "vpc" {
  source             = "../../modules/vpc"
  region             = local.region
  module_tags        = var.tags
  module_name        = var.name_prefix
  vpc_cidr           = var.vpc_cidr
  number_of_az       = var.number_of_az
  has_public_subnet  = var.has_public_subnet
  has_private_subnet = var.has_private_subnet
  nat_gateway_az     = 0
  has_nat_gateway    = true
}

# module "natgateway" {
#   source = "../../modules/natgateway"

#   module_name = var.name_prefix
#   module_tags = var.tags
#   number_of_prisubnet = var.number_of_az
#   nat_subnet_id = keys(module.vpc.publicsubnet)[0]
#   privatesubnet = keys(module.vpc.privatesubnet)
#   vpc_id = module.vpc.vpc_id
#   depends_on = [ module.vpc ]
# }