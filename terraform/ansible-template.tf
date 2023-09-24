data "template_file" "ansible_inventory" {
  template = file("${path.module}/ansible-inventory.tpl")

  vars = {
    server_ip = hcloud_server.my_server.ipv4_address
  }
}

resource "null_resource" "ansible_inventory" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "mv ${path.module}/ansible-inventory.tpl ../ansible/inventory.yml"
  }
}
