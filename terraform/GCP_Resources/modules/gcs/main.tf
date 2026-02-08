# Create GCS Bucket
resource "google_storage_bucket" "this" {
  name          = var.bucket_name
  project       = var.project_id
  location      = var.location
  force_destroy = true

  uniform_bucket_level_access = true
}

# Grant bucket access to EXISTING service account
resource "google_storage_bucket_iam_member" "sa_access" {
  for_each = toset(var.bucket_roles)

  bucket = google_storage_bucket.this.name
  role   = each.value
  member = "serviceAccount:${var.service_account_email}"
}
