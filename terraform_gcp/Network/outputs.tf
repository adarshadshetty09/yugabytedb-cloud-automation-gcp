output "vpc_name" {
  value = module.vpc.vpc_name
}

output "subnet_name" {
  value = module.subnet.subnet_name
}

output "subnet_self_link" {
  value = module.subnet.subnet_self_link
}

output "nat_name" {
  value = module.nat.nat_name
}
