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
    target_tags   = ["internal"]
  }

  #  Public SSH (for practice only)
  allow-ssh-public = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["22"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["k8s"]
  }

  #  Kubernetes Core Ports (PUBLIC for practice)
  k8s-cluster = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports = [
      "6443",            # API Server
      "2379-2380",       # etcd
      "10250",           # kubelet
      "10257",           # controller-manager
      "10259",           # scheduler
      "30000-32767",     # NodePort Services
      "80",              # HTTP
      "443"              # HTTPS
    ]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["k8s"]
  }

  #  Calico Networking (PUBLIC for practice)
  k8s-calico-tcp = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["179"]   # BGP
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["k8s"]
  }

  k8s-calico-udp = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "udp"
    ports         = ["4789"]  # VXLAN
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["k8s"]
  }

  #  Optional: Open ALL ports (use ONLY if needed)
  allow-all = {
    direction     = "INGRESS"
    priority      = 2000
    protocol      = "all"
    ports         = []
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["k8s"]
  }

  #  Jenkins (keep internal or make public if needed)
  jenkins = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["8080"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["jenkins"]
  }

  #  Monitoring tools (optional public)
  monitoring = {
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["3000", "9090", "9200", "9115", "9093", "9187"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["monitoring"]
  }

  # Yugabyte DB ( public only for learning)
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
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["yugabyte"]
  }

  
}