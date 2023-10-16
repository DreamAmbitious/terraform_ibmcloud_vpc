output "ssh_ip" {
  value = ibm_is_floating_ip.floatingip.address
}  

output "target_mount_path" {
  value = ibm_is_share_mount_target.target.mount_path
}