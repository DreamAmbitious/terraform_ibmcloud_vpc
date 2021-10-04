data "ibm_resource_group" "group" {
  name     = var.namespace
}

module vpc {
  source = "./modules/vpc"
  namespace = var.namespace
  resource_group_id = data.ibm_resource_group.group.id
  region = var.region
}
