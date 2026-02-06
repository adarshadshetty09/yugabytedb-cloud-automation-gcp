module "gcp_vm_config" {
  source     = "./modules/gcp_vm"
  project_id = var.project_id
  for_each   = var.gcp_vm

  instance_name              = each.value.instance_name
  machine_type_name          = each.value.machine_type_name
  zone_name                  = each.value.zone_name
  network_name               = each.value.network_name
  subnet_work_name           = each.value.subnet_work_name
  instance_image_self_link   = each.value.instance_image_self_link
  instance_labels            = each.value.instance_labels
  netwoork_tags              = each.value.netwoork_tags   # Network Tags
  boot_disk_tags             = each.value.boot_disk_tags 
  instance_disk_labels       = each.value.instance_disk_labels 
  allow_stopping_for_update_value = each.value.allow_stopping_for_update_value
  deletion_protection = each.value.deletion_protection
  boot_disk_size = each.value.boot_disk_size
  boot_disk_type = each.value.boot_disk_type
}

