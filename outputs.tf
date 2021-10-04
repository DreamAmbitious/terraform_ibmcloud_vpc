output "ipaddress" {
  value       = module.instance.ssh_ip
  description = "The ip to ssh the vsi."
}