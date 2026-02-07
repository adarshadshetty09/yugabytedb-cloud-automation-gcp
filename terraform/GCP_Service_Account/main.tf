provider "google" {
  project = var.project_id
}

module "service_accounts" {
  source           = "./modules/service_accounts"
  project_id       = var.project_id
  service_accounts = var.service_accounts
}
