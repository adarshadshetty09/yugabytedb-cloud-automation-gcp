project_id         = "project-7b6bf38a-3ad2-4d2b-bdb"
network_project_id = "project-7b6bf38a-3ad2-4d2b-bdb"

region = "us-central1"

vpc = {
  name = "vpc-yugabyte-terraform-cluster"
}

subnet = {
  name = "yugabyte-sub-1"
  cidr = "10.0.0.0/24"
}


firewall_rules = {
  allow-internal = {
    direction     = "INGRESS"
    priority      = 65534
    protocol      = "all"
    ports         = []
    source_ranges = ["0.0.0.0/0"]
    target_tags   = []
  }

  allow-ssh = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["22"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["allow-ssh"]
  }

  allow-yugabyte = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["7000", "9000", "9042", "5433","443"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["yugabyte"]
  }


  allow-yugabyte-all-port = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports = [
  "22",
  "80",
  "443",
  "5432",
  "5433",
  "6379",
  "7000",
  "7100",
  "9000",
  "9100",
  "9300",
  "9400",
  "9042",
  "54422",
  "15433"
]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["yugabyte"]
  }

  jenkins-port = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["8080"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["jenkins","softwares"]
  }
}

