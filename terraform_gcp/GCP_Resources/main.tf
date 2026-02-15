provider "google" {
  project = var.project_id
}

module "gcs_buckets01" {
  source   = "./modules/gcs"
  for_each = var.gcs_buckets_yugabyte

  project_id = var.project_id
  bucket_name = each.key
  location    = each.value.location

  service_account_email = each.value.service_account_email
  bucket_roles          = each.value.bucket_roles
}



# module "gcs_buckets02" {
#   source   = "./modules/gcs"
#   for_each = var.gcs_buckets_yugabyte

#   project_id = var.project_id
#   bucket_name = each.key
#   location    = each.value.location

#   service_account_email = each.value.service_account_email
#   bucket_roles          = each.value.bucket_roles
# }


