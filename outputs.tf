output "resource_group_id" {
  value       = data.ibm_resource_group.group.id
  description = "The resource group ip to provision the resources."
}