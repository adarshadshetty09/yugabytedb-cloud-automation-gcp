provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source = "./modules/vpc"

  network_project_id = var.network_project_id
  vpc_name           = var.vpc.name
}

module "subnet" {
  source = "./modules/subnet"

  network_project_id = var.network_project_id
  region             = var.region
  subnet_name        = var.subnet.name
  subnet_cidr        = var.subnet.cidr
  vpc_id             = module.vpc.vpc_id
}

module "nat" {
  source = "./modules/nat"

  project_id = var.project_id
  region     = var.region
  vpc_id     = module.vpc.vpc_id
  vpc_name   = module.vpc.vpc_name
  subnet_id = module.subnet.subnet_self_link
}

module "firewall" {
  source = "./modules/firewall"

  network_project_id = var.network_project_id
  vpc_name           = module.vpc.vpc_name
  firewall_rules     = var.firewall_rules
}
