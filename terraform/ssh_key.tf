resource "hcloud_ssh_key" "locust-ssh" {
  name       = "locust-ssh"
  public_key = file("./locust-ssh-key.pub")
}
