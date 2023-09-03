resource "hcloud_network" "private_network" {
  name       = "private-network"
  ip_range   = var.network_cidr
}

resource "hcloud_network_subnet" "private_subnet" {
  network_id   = hcloud_network.private_network.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}

resource "hcloud_server_network" "worker-network" {
  count = 2
  server_id  = hcloud_server.locust-worker[count.index].id
  network_id = hcloud_network.private_network.id
}

resource "hcloud_server_network" "master-network" {
  server_id  = hcloud_server.locust-master.id
  network_id = hcloud_network.private_network.id
}

