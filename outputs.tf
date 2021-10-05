output "ipaddress" {
  value       = module.instance.ssh_ip
  description = "The ip to ssh the vsi."
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The vpc id to map block or shares."
}