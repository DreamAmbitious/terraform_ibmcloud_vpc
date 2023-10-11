variable "namespace" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_subnet_cidr_block" {
  type = string
}

variable "vpc_subnet_zone" {
  type = string
}

variable "ssh_key_path" {
  type = string
}

variable "instance_image_id" {
  type = string
  default = "r006-fedc50ed-8ea3-4a66-9559-c482c4e6ed88"
}

variable "instance_profile" {
  type = string
  default = "bx2-2x8"
}


variable "ibmcloud_api_key" {
  type = string
}