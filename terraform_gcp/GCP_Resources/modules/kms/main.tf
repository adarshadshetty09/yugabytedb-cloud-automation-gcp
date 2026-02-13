# Get project number (needed for compute service agent)
data "google_project" "project" {
  project_id = var.project_id
}

resource "google_kms_key_ring" "keyring" {
  name     = var.keyring_name
  location = var.location
  project  = var.project_id
}

resource "google_kms_crypto_key" "crypto_key" {
  name            = var.key_name
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = var.rotation_period

  lifecycle {
    prevent_destroy = false
  }
}

# ✅ Yugabyte service account (creator / user)
resource "google_kms_crypto_key_iam_member" "yugabyte_sa" {
  crypto_key_id = google_kms_crypto_key.crypto_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${var.service_account_email}"
}

# ✅ REQUIRED for Packer / Compute Engine encryption
resource "google_kms_crypto_key_iam_member" "compute_engine_sa" {
  crypto_key_id = google_kms_crypto_key.crypto_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  member = "serviceAccount:service-${data.google_project.project.number}@compute-system.iam.gserviceaccount.com"
}