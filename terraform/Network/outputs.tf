output "project_id" {
  value = var.project_id
}

output "network_project_id" {
  value = var.network_project_id
}

output "region" {
  value = var.region
}

output "vpc_name" {
  value = module.vpc.vpc_name
}

output "subnet_name" {
  value = module.vpc.subnet_name
}

output "subnet_self_link" {
  value = module.vpc.subnet_self_link
}


output "firewall_rules" {
  value = module.firewall.firewall_rule_names
}
