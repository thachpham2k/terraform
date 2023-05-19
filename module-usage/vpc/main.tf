module "vpc" {
  source             = "../../modules/vpc"
  region             = local.region
  module_tags        = var.tags
  module_name        = "vpc"
  vpc_cidr           = "10.1.0.0/16"
  number_of_az       = 0
  has_public_subnet  = true
  has_private_subnet = true
  has_s3_endpoint    = false
}