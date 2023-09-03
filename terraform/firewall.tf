resource "hcloud_firewall" "locust" {
  name   = "locust-firewall"
  labels = {
    "Clister" = "locust"
  }
  
  rule {
    direction     = "in"
    source_ips    = [var.network_cidr]
    protocol      = "tcp"
    port          = "22"
    description   = "Allow internal network communication"
  }

  rule {
    direction     = "in"
    source_ips    = ["0.0.0.0/0"]
    protocol      = "tcp"
    port          = "22"
    description   = "Allow SSH from anywhere"
  }

  rule {
    direction     = "in"
    source_ips    = ["0.0.0.0/0"]
    protocol      = "tcp"
    port          = "5557"
    description   = "Allow internal network communication"
  }

  rule {
    direction     = "in"
    source_ips    = ["0.0.0.0/0"]
    protocol      = "tcp"
    port          = "8089"   
    description   = "Allow HTTP traffic from the internet"
  }
}
