variable "namespace" {
  type = string
}

variable "resource_group_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ssh_key_path" {
  type = string
}

variable "image_id" {
  type = string
}

variable "zone" {
  type = string
}

variable "instance_profile" {
  type = string
  default = "bx2-2x8"
}