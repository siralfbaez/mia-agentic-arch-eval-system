resource "google_compute_ha_vpn_gateway" "usps_bridge" {
  name    = "usps-to-gcp-ha-vpn"
  network = var.vpc_id
  region  = "us-east1"
}

# This represents the secure tunnel to the USPS On-Prem Data Center
resource "google_compute_external_vpn_gateway" "usps_on_prem" {
  name            = "usps-legacy-dc"
  redundancy_type = "FOUR_IPS_REDUNDANCY"
  description     = "Gateway for USPS Legacy IBM/Oracle On-Prem Systems"

  interface {
    id         = 0
    ip_address = "203.0.113.1" # Example USPS Peer IP
  }
}