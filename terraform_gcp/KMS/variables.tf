variable "project_id" {
  description = "GCP Project ID"
  type        = string
}



variable "kms_keys" {
  description = "Map of KMS keys"
  type = map(object({
    location              = string
    keyring_name          = string
    service_account_email = string
  }))
}