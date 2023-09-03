variable "hcloud_token" {
  sensitive = true
}

variable "network_cidr" {
  default = "10.0.0.0/16"
}

variable "location" {
  default = "fsn1"
}

