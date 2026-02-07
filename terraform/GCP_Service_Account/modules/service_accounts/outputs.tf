output "service_account_emails" {
  description = "Service account emails"
  value = {
    for sa_key, sa in google_service_account.this :
    sa_key => sa.email
  }
}

output "service_account_names" {
  description = "Service account resource names"
  value = {
    for sa_key, sa in google_service_account.this :
    sa_key => sa.name
  }
}
