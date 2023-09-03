resource "hcloud_floating_ip" "master" {
  type      = "ipv4"
  server_id = hcloud_server.locust-master.id
}

resource "hcloud_primary_ip" "locust-master-ip" {
name          = "locust-master-ip"
datacenter    = "fsn1-dc14"
type          = "ipv4"
assignee_type = "server"
auto_delete   = false
  labels = {
    "Name" : "locust-master"
  }
}

resource "hcloud_server" "locust-master" {
  name        = "locust-master-1"
  image       = "debian-12"
  server_type = "cx11"
  location    = var.location
  backups     = false

  firewall_ids = [hcloud_firewall.locust.id]

  public_net {
    ipv4_enabled = true
    ipv4 = hcloud_primary_ip.locust-master-ip.id
    ipv6_enabled = false
  }

  labels = {
    "role"    = "locust-master"
    "cluster" = "locust"
  }

  ssh_keys = [hcloud_ssh_key.locust-ssh.id]

}

resource "hcloud_server" "locust-worker" {
  count       = 2
  name        = "locust-worker-${count.index + 1}"
  image       = "debian-12"
  server_type = "cx11"
  location    = var.location
  backups     = false

  firewall_ids = [hcloud_firewall.locust.id]

  labels = {
    "role"    = "locust-worker"
    "cluster" = "locust"
  }

  ssh_keys = [hcloud_ssh_key.locust-ssh.id]

}

