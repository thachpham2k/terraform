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

module "natinstance" {
  source               = "./modules/natinstance"
  vpc-id               = module.vpc.vpc-id
  natintance-subnet-id = module.vpc.publicsubnet0-id
  private-subnet       = module.vpc.privatesubnet
  project-name         = var.project-name
}
