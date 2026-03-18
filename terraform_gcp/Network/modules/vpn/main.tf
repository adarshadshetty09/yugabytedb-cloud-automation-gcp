resource "google_compute_ha_vpn_gateway" "vpn" {
  name    = "ha-vpn-gateway"
  network = var.network
  region  = var.region
  project = var.project_id
}

resource "google_compute_external_vpn_gateway" "onprem" {
  name            = "onprem-gateway"
  redundancy_type = "SINGLE_IP_INTERNALLY_REDUNDANT"

  interface {
    id         = 0
    ip_address = var.peer_ip
  }
}

resource "google_compute_vpn_tunnel" "tunnel" {
  name                  = "vpn-tunnel"
  region                = var.region
  vpn_gateway           = google_compute_ha_vpn_gateway.vpn.id
  peer_external_gateway = google_compute_external_vpn_gateway.onprem.id
  shared_secret         = var.shared_secret
  ike_version           = 2

  local_traffic_selector  = ["10.0.0.0/24"]
  remote_traffic_selector = ["0.0.0.0/0"]
}

resource "google_compute_route" "vpn_route" {
  name       = "vpn-route"
  network    = var.network
  dest_range = "0.0.0.0/0"

  next_hop_vpn_tunnel = google_compute_vpn_tunnel.tunnel.id
  priority            = 1000
}