
module "kms_keys" {
  source   = "./modules/kms"
  for_each = var.kms_keys

  project_id            = var.project_id
  location              = each.value.location
  keyring_name          = each.value.keyring_name
  key_name              = each.key
  service_account_email = each.value.service_account_email
}