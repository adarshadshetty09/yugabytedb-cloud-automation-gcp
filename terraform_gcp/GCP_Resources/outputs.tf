

output "bucket_names01" {
  description = "List of created GCS bucket names"
  value       = [for b in module.gcs_buckets01 : b.bucket_name]
}

output "bucket_urls" {
  description = "GCS bucket URLs"
  value       = [for b in module.gcs_buckets01 : b.bucket_url]
}



