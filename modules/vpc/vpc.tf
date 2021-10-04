resource "ibm_is_vpc" "vpc" {
  name = "${var.namespace}-vpc"
  resource_group = var.resource_group_id
}