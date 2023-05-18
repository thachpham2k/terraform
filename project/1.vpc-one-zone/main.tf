module "vpc" {
  source       = "./modules/vpc"
  vpc-cidr     = "10.1.0.0/16"
  project-name = "vpc1zone"
  region       = local.region
}