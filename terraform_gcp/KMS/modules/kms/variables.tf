variable "project_id" {}
variable "location" {}
variable "keyring_name" {}
variable "key_name" {}
variable "service_account_email" {}

variable "rotation_period" {
  default = "2592000s"
}