output "ipaddress" {
  value       = module.instance.ssh_ip
  description = "The ip to ssh the vsi."
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The vpc id to map block or shares."
}

output "mount_path" {
  value       = module.instance.target_mount_path
  description = "The target mount path."
}