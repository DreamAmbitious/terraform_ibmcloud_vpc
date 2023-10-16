resource "ibm_is_share" "is_share" {
  zone           = var.zone
  size           = 220
  name           = "${var.namespace}-share"
  profile        = "dp2"
  resource_group = var.resource_group_id
}

resource "ibm_is_share_mount_target" "target" {
  name = "${var.namespace}-share-target"
  share = ibm_is_share.is_share.id
  transit_encryption = "user_managed"
  virtual_network_interface {
    subnet = var.subnet_id
    name = "${var.namespace}-vni"
  }
}
