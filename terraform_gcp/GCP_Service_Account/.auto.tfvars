project_id = "project-7b6bf38a-3ad2-4d2b-bdb"

service_accounts = {
  yugabyte = {
    account_id   = "yugabyte"
    display_name = "Yugabyte Central Service Account"
    roles = [
      "roles/compute.instanceAdmin.v1",
      "roles/iam.serviceAccountUser",
      "roles/iap.tunnelResourceAccessor",
      "roles/cloudkms.admin",
      "roles/storage.objectAdmin"
    ]
  }
}