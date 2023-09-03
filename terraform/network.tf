resource "hcloud_network" "private_network" {
  name       = "private-network"
  ip_range   = "10.0.0.0/16"
}
