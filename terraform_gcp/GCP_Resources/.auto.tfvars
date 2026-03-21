project_id = "project-7b6bf38a-3ad2-4d2b-bdb"




gcs_buckets_yugabyte = {
  "yba-bucket-opensource" = {
    location              = "US"
    service_account_email = "yugabyte@project-7b6bf38a-3ad2-4d2b-bdb.iam.gserviceaccount.com"
    bucket_roles          = [
      "roles/storage.objectAdmin",
      "roles/storage.legacyBucketReader" ## for ybdb backup
      ]
  }
}

# gcs_buckets = {
#   "yba-backup-bucket-001" = {
#     location              = "US"
#     service_account_email = "yugabyte@project-af758472-c239-4625-869.iam.gserviceaccount.com"
#     bucket_roles          = ["roles/storage.objectAdmin"]
#   }
# }





