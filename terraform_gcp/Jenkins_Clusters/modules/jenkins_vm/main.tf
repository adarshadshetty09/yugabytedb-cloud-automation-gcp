resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type_name
  zone         = var.zone_name

  tags   = var.netwoork_tags
  labels = var.instance_labels

  boot_disk {
    auto_delete = true

    initialize_params {
      image  = var.instance_image_self_link
      labels = var.instance_disk_labels
      size   = var.boot_disk_size
      type   = var.boot_disk_type
    }
  }

  # Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  deletion_protection       = var.deletion_protection
  allow_stopping_for_update = var.allow_stopping_for_update_value

  network_interface {
    network    = var.network_name
    subnetwork = var.subnet_work_name

    # Required if you want external SSH
    access_config {}
  }

  # ✅ ENTERPRISE SSH (NO USERNAME / NO KEY)
  metadata = {
    enable-oslogin = "TRUE"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    email  = "296131585508-compute@developer.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}