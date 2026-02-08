variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "gcs_buckets" {
  description = "Map of GCS buckets configuration"
  type = map(object({
    location               = string
    service_account_email  = string
    bucket_roles            = list(string)
  }))
}


variable "gcs_buckets_yugabyte" {
  description = "Map of GCS buckets configuration"
  type = map(object({
    location               = string
    service_account_email  = string
    bucket_roles            = list(string)
  }))
}