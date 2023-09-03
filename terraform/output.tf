output "locust_master_public_ips" {
  value = hcloud_server.locust-master.ipv4_address
}

output "locust_worker_public_ips" {
  value = [for server in hcloud_server.locust-worker : server.ipv4_address]
}

