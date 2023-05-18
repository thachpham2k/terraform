module "vpc" {
  source       = "./modules/vpc"
  vpc-cidr     = var.vpc-cidr
  project-name = var.project-name
  region       = local.region
}

module "sshkeypair" {
  source       = "./modules/sshkeypair"
  project-name = var.project-name
}

