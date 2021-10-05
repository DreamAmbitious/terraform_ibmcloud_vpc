resource "ibm_is_vpc" "vpc" {
  name = "${var.namespace}-vpc"
  resource_group = var.resource_group_id
}

resource "ibm_is_subnet" "subnet" {
  name            = "${var.namespace}-subnet"
  vpc             = ibm_is_vpc.vpc.id
  zone            = var.subnet_zone
  ipv4_cidr_block = var.subnet_cidr_block

  //User can configure timeouts
  timeouts {
    create = "90m"
    delete = "30m"
  }
}

resource "ibm_is_security_group_rule" "ssh_security_group_rule" {
  group     = ibm_is_vpc.vpc.security_group[0].group_id
  direction = "inbound"
  remote    = "0.0.0.0/0"
  tcp {
    port_min = 22
    port_max = 22
  }
}