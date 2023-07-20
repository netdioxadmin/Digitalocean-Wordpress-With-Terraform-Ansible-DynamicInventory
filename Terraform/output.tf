# Taking Ubuntu Images List in Region
data "digitalocean_images" "ubuntu" {
  filter {
    key    = "distribution"
    values = ["Ubuntu"]
  }
  filter {
    key    = "regions"
    values = ["${var.region}"]
  }
  filter {
    key    = "private"
    values = ["false"]
  }
}

output "image-name" {
  value = data.digitalocean_images.ubuntu.images

}

#Taking Data from Digital Ocean Droplet 
data "digitalocean_droplet" "ipadress" {
  name = digitalocean_droplet.wordpress.name
}
output "dropletip" {
  value = data.digitalocean_droplet.ipadress
}

resource "local_file" "wpipaddress" {
  content  = data.digitalocean_droplet.ipadress.ipv4_address
  filename = "${var.projectname}-IP-Address"
}

# resource "null_resource" "localinventorynull01" {

#   triggers = {
#     mytest = timestamp()
#   }

#   provisioner "local-exec" {
#     command = "echo ${digitalocean_droplet.wordpress.name} ansible_host=${data.digitalocean_droplet.ipadress.ipv4_address} ansible_user=root ansible_ssh_private_key_file=${var.projectname}-ssh-key >> ../Ansible/inventory"

#   }
# }

data "template_file" "ansible" {
  template = file("ansible_inventory.tmpl")
  vars = {
    serve_name          = "${digitalocean_droplet.wordpress.name}"
    ip_address          = "${data.digitalocean_droplet.ipadress.ipv4_address}"
    username            = "${var.username}"
    ansible_ssh_keyfile = "${var.projectname}-ssh-key"
  }
}