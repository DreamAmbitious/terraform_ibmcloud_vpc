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
  default = "r134-ed3f775f-ad7e-4e37-ae62-7199b4988b00"
}

variable "instance_profile" {
  type = string
  default = "bx2-2x8"
}