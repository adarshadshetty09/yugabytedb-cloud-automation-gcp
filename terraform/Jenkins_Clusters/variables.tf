variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "gcp_vm" {
  type = map(object({
    instance_name              = string
    machine_type_name          = string
    zone_name                  = string
    network_name               = string
    subnet_work_name           = string
    instance_image_self_link   = string
    instance_labels            = map(string)
    netwoork_tags              = list(string)
    boot_disk_tags             = list(string)   
    instance_disk_labels       = map(string)
    allow_stopping_for_update_value = bool
    deletion_protection  = bool
    boot_disk_size       = number
    boot_disk_type       = string
  }))
}

