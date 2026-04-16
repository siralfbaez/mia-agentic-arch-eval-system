resource "google_container_cluster" "usps_agentic_cluster" {
  name     = "usps-assessment-cluster"
  location = "us-east1"

  # Enabling Autopilot for cost-optimization and reduced OpEx
  enable_autopilot = true

  # NIST 800-53 Requirement: Private Cluster
  networking_mode = "VPC_NATIVE"
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false # Allow master access from authorized networks
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }
}