module "vpc" {
  source       = "./modules/vpc"
  vpc-cidr     = "10.2.0.0/16"
  project-name = "vpc2zone"
  region       = local.region
}