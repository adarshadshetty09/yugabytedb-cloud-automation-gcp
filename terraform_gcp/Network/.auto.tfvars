project_id         = "project-7b6bf38a-3ad2-4d2b-bdb"
network_project_id = "project-7b6bf38a-3ad2-4d2b-bdb"

region = "us-south1"

vpc = {
  name = "vpc-yugabyte-terraform-cluster"
}

subnet = {
  name = "yugabyte-sub-1"
  cidr = "10.0.0.0/24"
}

firewall_rules = {

  #  Internal communication inside VPC
  allow-internal = {
    direction     = "INGRESS"
    priority      = 65534
    protocol      = "all"
    ports         = []
    source_ranges = ["10.0.0.0/24"]
    target_tags   = ["internal","k8s","yugabyte","monitoring","jenkins"]
  }

  #  SSH via IAP (NO public SSH)
  allow-ssh-iap = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["22"]

    # 🔥 Google IAP IP range
    source_ranges = ["35.235.240.0/20"]

    target_tags   = ["allow-ssh"]
  }

  #  Kubernetes Core Ports (ONLY INTERNAL)
  k8s-cluster = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports = [
      "6443",
      "2379-2380",
      "10250",
      "10257",
      "10259",
      "30000-32767",
      "80",
      "443"
    ]
    source_ranges = ["10.0.0.0/24"]
    target_tags   = ["k8s"]
  }

  #  Calico (ONLY INTERNAL)
  k8s-calico-tcp = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["179"]
    source_ranges = ["10.0.0.0/24"]
    target_tags   = ["k8s"]
  }

  k8s-calico-udp = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "udp"
    ports         = ["4789"]
    source_ranges = ["10.0.0.0/24"]
    target_tags   = ["k8s"]
  }

  #  REMOVED allow-all (unsafe)

  #  Jenkins (INTERNAL ONLY)
  jenkins = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["8080"]
    source_ranges = ["10.0.0.0/24"]
    target_tags   = ["jenkins"]
  }

  #  Monitoring (INTERNAL ONLY)
  monitoring = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["3000", "9090", "9200", "9115", "9093", "9187"]
    source_ranges = ["10.0.0.0/24"]
    target_tags   = ["monitoring"]
  }

  #  Yugabyte (INTERNAL ONLY)
  yugabyte = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports = [
      "7000", "7100",
      "9000", "9100",
      "9042", "5433",
      "15433", "18018",
      "9300", "9070",
      "12000", "13000"
    ]
    source_ranges = ["10.0.0.0/24"]
    target_tags   = ["yugabyte"]
  }

}