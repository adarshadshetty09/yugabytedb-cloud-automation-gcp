############################
# VPN Gateway
############################
resource "google_compute_vpn_gateway" "vpn" {
  name    = "vpn-gateway"
  network = var.network
  region  = var.region
  project = var.project_id
}

############################
# External IP
############################
resource "google_compute_address" "vpn_ip" {
  name   = "vpn-ip"
  region = var.region
}

############################
# Forwarding Rules
############################
resource "google_compute_forwarding_rule" "esp" {
  name        = "vpn-esp"
  region      = var.region
  ip_protocol = "ESP"
  ip_address  = google_compute_address.vpn_ip.address
  target      = google_compute_vpn_gateway.vpn.id
}

resource "google_compute_forwarding_rule" "udp500" {
  name        = "vpn-udp500"
  region      = var.region
  ip_protocol = "UDP"
  port_range  = "500"
  ip_address  = google_compute_address.vpn_ip.address
  target      = google_compute_vpn_gateway.vpn.id
}

resource "google_compute_forwarding_rule" "udp4500" {
  name        = "vpn-udp4500"
  region      = var.region
  ip_protocol = "UDP"
  port_range  = "4500"
  ip_address  = google_compute_address.vpn_ip.address
  target      = google_compute_vpn_gateway.vpn.id
}

############################
# VPN Tunnel
############################
resource "google_compute_vpn_tunnel" "tunnel" {
  name               = "vpn-tunnel"
  region             = var.region
  target_vpn_gateway = google_compute_vpn_gateway.vpn.id
  peer_ip            = var.peer_ip
  shared_secret      = var.shared_secret

  ike_version = 2

  local_traffic_selector  = ["10.0.0.0/24"]
  remote_traffic_selector = ["0.0.0.0/0"]
  depends_on = [
  google_compute_forwarding_rule.esp,
  google_compute_forwarding_rule.udp500,
  google_compute_forwarding_rule.udp4500
]
}

# ############################
# # Route
# ############################
# resource "google_compute_route" "vpn_route" {
#   name       = "vpn-route"
#   network    = var.network
#   dest_range = "10.0.0.0/24"

#   next_hop_vpn_tunnel = google_compute_vpn_tunnel.tunnel.id
# }