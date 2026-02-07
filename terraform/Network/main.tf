provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source = "./modules/vpc"

  project_id         = var.project_id
  network_project_id = var.network_project_id
  region             = var.region

  vpc_name    = var.vpc.name
  subnet_name = var.subnet.name
  subnet_cidr = var.subnet.cidr
}



module "firewall" {
  source = "./modules/firewall"

  network_project_id = var.network_project_id
  vpc_name           = module.vpc.vpc_name
  firewall_rules     = var.firewall_rules
}
