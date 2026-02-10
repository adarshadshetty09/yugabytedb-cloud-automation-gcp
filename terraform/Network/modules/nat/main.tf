resource "google_compute_router" "this" {
  name    = "${var.vpc_name}-router"
  network = var.vpc_id
  region  = var.region
  project = var.project_id
}

resource "google_compute_router_nat" "this" {
  name       = "${var.vpc_name}-nat"
  router    = google_compute_router.this.name
  region    = var.region
  project   = var.project_id

  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = var.subnet_id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
