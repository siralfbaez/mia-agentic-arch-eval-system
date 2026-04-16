resource "google_kms_key_ring" "usps_keyring" {
  name     = "usps-assessment-keyring"
  location = "us-east1" # Near DC/Raleigh hubs
}

resource "google_kms_crypto_key" "assessment_data_key" {
  name            = "assessment-engine-key"
  key_ring        = google_kms_key_ring.usps_keyring.id
  rotation_period = "7776000s" # 90 days rotation - NIST best practice

  lifecycle {
    prevent_destroy = true
  }
}