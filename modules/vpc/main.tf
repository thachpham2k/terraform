module "vpc" {
  source             = "./vpc"
  region             = local.region
  module_tags        = var.tags
  module_name        = "vpc"
  vpc_cidr           = "10.1.0.0/16"
  number_of_az       = 3
  has_public_subnet  = true
  has_private_subnet = true
  has_s3_endpoint    = false
}