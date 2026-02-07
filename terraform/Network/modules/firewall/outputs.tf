output "firewall_rule_names" {
  value = keys(google_compute_firewall.this)
}
