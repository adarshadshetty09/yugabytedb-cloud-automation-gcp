variable "project_id" {
  type = string
}

variable "service_accounts" {
  type = map(object({
    account_id   = string
    display_name = string
    roles        = list(string)
  }))
}
