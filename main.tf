data "ibm_resource_group" "group" {
  name     = var.namespace
}

module vpc {
  source = "./modules/vpc"
  namespace = var.namespace
  resource_group_id = data.ibm_resource_group.group.id
  region = var.region
  subnet_cidr_block = var.vpc_subnet_cidr_block
  subnet_zone = var.vpc_subnet_zone
}

module instance {
  source = "./modules/instance"
  namespace = var.namespace
  resource_group_id = data.ibm_resource_group.group.id
  zone = var.vpc_subnet_zone
  ssh_key_path = var.ssh_key_path
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
  image_id = var.instance_image_id
}
