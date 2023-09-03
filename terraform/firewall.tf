resource "hcloud_firewall" "locust" {
  name   = "locust-firewall"
  labels = {
    "Clister" = "locust"
  }
  
  rule {
    direction     = "in"
    source_ips    = ["10.0.0.0/16"]
    protocol      = "tcp"
    port          = "0-65535"
    description   = "Allow internal network communication"
  }

  rule {
    direction     = "in"
    source_ips    = ["0.0.0.0/0"]
    protocol      = "tcp"
    port          = "80"   
    description   = "Allow HTTP traffic from the internet"
  }

  rule {
    direction     = "out"
    protocol      = "tcp"
    port          = "0-65535"
    description   = "Allow all outbound traffic"
  }
}
