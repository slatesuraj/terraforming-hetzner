output "server_public_ips" {
  value = hcloud_server.locust-master.ipv4_address
}

output "locust_worker_private_ips" {
  value = [for server in hcloud_server.locust-worker : server.ipv4_address]
}

output "master-floatin-ip" {
  value = hcloud_floating_ip.master.ip_address
}
