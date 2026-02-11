output "bucket_names01" {
  value = [for b in module.gcs_buckets01 : b.bucket_name]
}


# output "bucket_names02" {
#   value = [for b in module.gcs_buckets02 : b.bucket_name]
# }
