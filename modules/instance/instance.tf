resource "ibm_is_ssh_key" "sshkey" {
  name           = "${var.namespace}-sshkey"
  public_key     = file(var.ssh_key_path)
  resource_group = var.resource_group_id
}

resource "ibm_is_instance" "instance" {
  name    = "${var.namespace}-instance"
  image   = var.image_id
  profile = var.instance_profile
  metadata_service {
    enabled            = true
    protocol           = "https"
    response_hop_limit = 5
  }

  primary_network_interface {
    name   = "eth0"
    subnet = var.subnet_id
  }

  vpc  = var.vpc_id
  zone = var.zone
  keys = [ibm_is_ssh_key.sshkey.id]

  //User can configure timeouts
  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}

resource "ibm_is_floating_ip" "floatingip" {
  name           = "${var.namespace}-instance"
  resource_group = var.resource_group_id
  target         = ibm_is_instance.instance.primary_network_interface[0].id
}
