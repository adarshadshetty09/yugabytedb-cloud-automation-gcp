resource "google_kms_key_ring" "keyring" {
  name     = var.keyring_name
  location = var.location
  project  = var.project_id
}

resource "google_kms_crypto_key" "crypto_key" {
  name            = var.key_name
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = var.rotation_period

#   lifecycle {
#     prevent_destroy = true   # ✅ production safety
#   }
}

resource "google_kms_crypto_key_iam_member" "crypto_key_member" {
  crypto_key_id = google_kms_crypto_key.crypto_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${var.service_account_email}"
}