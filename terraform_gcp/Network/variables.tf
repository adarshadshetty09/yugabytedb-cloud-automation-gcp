variable "project_id" {
  type = string
}

variable "network_project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc" {
  type = object({
    name = string
  })
}

variable "subnet" {
  type = object({
    name = string
    cidr = string
  })
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
