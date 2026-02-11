resource "google_compute_subnetwork" "this" {
  project       = var.network_project_id
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = var.vpc_id
}
