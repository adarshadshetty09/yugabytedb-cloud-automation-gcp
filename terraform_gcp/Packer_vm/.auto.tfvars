project_id = "project-7b6bf38a-3ad2-4d2b-bdb"
region     = "us-central1"


gcp_vm = {
  packer = {
    instance_name            = "packer"
    machine_type_name        = "n2-standard-2"
    zone_name                = "us-central1-a"
    network_name             = "vpc-yugabyte-terraform-cluster"
    subnet_work_name         = "yugabyte-sub-1"
    instance_image_self_link = "projects/project-7b6bf38a-3ad2-4d2b-bdb/global/images/softwares-packer-jenkins-1773668660"#"projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20260114"

    instance_labels = {
      env  = "test"
      role = "docker"
    }
# Add the same tag that is mentioned in Network subnetwork "allow-ssh"
    netwoork_tags = [
  "allow-ssh",
  "docker",
  "test",
  "learning",
  "adarshadshetty",
  "rypae099",
  "jenkins",
  "softwares"
]

    boot_disk_tags = ["boot","ssd","primary"]  
    instance_disk_labels = {
      env = "database"
      role = "yugabyte"
    }
    allow_stopping_for_update_value = true
    deletion_protection  = false

    boot_disk_size = 30
    boot_disk_type = "pd-balanced"
  }
}
