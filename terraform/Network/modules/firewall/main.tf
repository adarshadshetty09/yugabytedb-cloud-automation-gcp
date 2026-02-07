resource "google_compute_firewall" "this" {
  for_each = var.firewall_rules

  project = var.network_project_id
  name    = each.key
  network = var.vpc_name

  direction = each.value.direction
  priority  = each.value.priority

  allow {
    protocol = each.value.protocol
    ports    = each.value.ports
  }

  source_ranges = each.value.source_ranges
  target_tags   = each.value.target_tags
}
