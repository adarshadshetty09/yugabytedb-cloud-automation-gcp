# -----------------------------------
# Create Service Accounts
# -----------------------------------
resource "google_service_account" "this" {
  for_each = var.service_accounts

  project      = var.project_id
  account_id   = each.value.account_id
  display_name = each.value.display_name
}

# -----------------------------------
# Flatten IAM role bindings
# -----------------------------------
locals {
  iam_bindings = flatten([
    for sa_key, sa in var.service_accounts : [
      for role in sa.roles : {
        sa_key = sa_key
        role   = role
      }
    ]
  ])
}

# -----------------------------------
# Attach IAM Roles
# -----------------------------------
resource "google_project_iam_member" "this" {
  for_each = {
    for binding in local.iam_bindings :
    "${binding.sa_key}-${binding.role}" => binding
  }

  project = var.project_id
  role    = each.value.role
  member  = "serviceAccount:${google_service_account.this[each.value.sa_key].email}"
}
