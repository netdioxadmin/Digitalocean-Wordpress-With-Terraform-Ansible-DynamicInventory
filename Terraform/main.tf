#Applying SSH key to digital ocean Console 
resource "digitalocean_ssh_key" "default" {
  name       = "${var.projectname}-key"
  public_key = tls_private_key.digital-ocean-ssh.public_key_openssh
}


# Create a new Droplet using the SSH key
resource "digitalocean_droplet" "wordpress" {
  image    = var.image
  name     = "server.${var.projectname}"
  region   = var.region
  size     = var.size
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]
}