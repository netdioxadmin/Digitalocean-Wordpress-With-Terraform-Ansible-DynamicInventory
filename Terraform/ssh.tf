resource "tls_private_key" "digital-ocean-ssh" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "local_file" "digital-ocean-private-key" {
  content  = tls_private_key.digital-ocean-ssh.private_key_pem
  filename = "${var.projectname}-ssh-key"
}

resource "local_file" "digital-ocean-public-key" {
  content  = tls_private_key.digital-ocean-ssh.public_key_openssh
  filename = "${var.projectname}-public-ssh-key"
}

resource "local_file" "keyfor-ansibe-private-key" {
  content         = tls_private_key.digital-ocean-ssh.private_key_pem
  filename        = "${var.current_working_dir}../Ansible/${var.projectname}-ssh-key"
  file_permission = 400

}

resource "local_file" "Ansible-inventory" {
  content         = data.template_file.ansible.rendered
  filename        = "${var.current_working_dir}../Ansible/inventory"
  file_permission = 400

}