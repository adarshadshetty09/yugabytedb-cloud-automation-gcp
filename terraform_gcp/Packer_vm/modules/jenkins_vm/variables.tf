variable "project_id" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "machine_type_name" {
  type = string
}

variable "zone_name" {
  type = string
}

variable "network_name" {
  type = string
}

variable "subnet_work_name" {
  type = string
}


variable "instance_image_self_link" {
  type = string
}

variable "instance_labels" {
  type = map(string)
}

variable "netwoork_tags" {
  type = list(string)
}

variable "boot_disk_tags" {
  type = list(string)
}
variable "instance_disk_labels" {
  type = map(string)
}

variable "deletion_protection" {
  type = bool
}

variable "allow_stopping_for_update_value" {
  type = bool
}

variable "boot_disk_size" {
  type = number
}

variable "boot_disk_type" {
  type = string
}