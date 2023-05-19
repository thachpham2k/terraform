module "vpc" {
  source             = "../../modules/vpc"
  region             = local.region
  module_tags        = var.tags
  module_name        = var.name_prefix
  vpc_cidr           = var.vpc_cidr
  number_of_az       = var.number_of_az
  has_public_subnet  = var.has_public_subnet
  has_private_subnet = var.has_private_subnet
  has_s3_endpoint    = var.has_s3_endpoint
}
