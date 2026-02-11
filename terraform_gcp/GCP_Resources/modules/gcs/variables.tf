variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "bucket_name" {
  type        = string
  description = "Globally unique GCS bucket name"
}

variable "location" {
  type        = string
  default     = "US"
}

variable "service_account_email" {
  type        = string
  description = "Existing service account email"
}

variable "bucket_roles" {
  type        = list(string)
  default     = ["roles/storage.objectAdmin"]
}
