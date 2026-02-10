resource "google_compute_network" "this" {
  project                 = var.network_project_id
  name                    = var.vpc_name
  auto_create_subnetworks = false
}
