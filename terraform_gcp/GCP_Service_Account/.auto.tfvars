project_id = "project-af758472-c239-4625-869"

service_accounts = {
  yugabyte = {
    account_id   = "yugabyte"
    display_name = "Yugabyte Central Service Account"
    roles = [
      "roles/compute.instanceAdmin.v1",
      "roles/iam.serviceAccountUser",
      "roles/iap.tunnelResourceAccessor"
    ]
  }
}
