variable "network_project_id" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "firewall_rules" {
  type = map(object({
    direction     = string
    priority      = number
    protocol      = string
    ports         = list(string)
    source_ranges = list(string)
    target_tags   = list(string)
  }))
}
