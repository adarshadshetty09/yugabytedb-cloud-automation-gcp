project_id = "project-af758472-c239-4625-869"




gcs_buckets_yugabyte = {
  "yba-bucket-001" = {
    location              = "US"
    service_account_email = "yugabyte@project-af758472-c239-4625-869.iam.gserviceaccount.com"
    bucket_roles          = ["roles/storage.objectAdmin"]
  }
}

# gcs_buckets = {
#   "yba-backup-bucket-001" = {
#     location              = "US"
#     service_account_email = "yugabyte@project-af758472-c239-4625-869.iam.gserviceaccount.com"
#     bucket_roles          = ["roles/storage.objectAdmin"]
#   }
# }



kms_keys = {
  "yba-key" = {
    location              = "us-central1"
    keyring_name          = "yba-keyring"
    service_account_email = "yugabyte@project-af758472-c239-4625-869.iam.gserviceaccount.com"
  }
}


