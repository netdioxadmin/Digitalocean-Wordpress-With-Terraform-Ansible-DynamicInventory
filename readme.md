markdown

# DigitalOcean WordPress Deployment with Terraform and Ansible (Dynamic Inventory)

This project automates the deployment of a WordPress website on DigitalOcean using Terraform and Ansible. It simplifies the setup process by leveraging Infrastructure as Code (IaC) and Configuration Management tools to provision and configure the required resources.

## Prerequisites

Before using this project, ensure you have the following prerequisites:

- [Terraform](https://www.terraform.io/) installed on your local machine.
- [Ansible](https://www.ansible.com/) installed on your local machine.
- A valid DigitalOcean account and API token.

## Getting Started

1. Clone this repository to your local machine.

git clone https://github.com/netdioxadmin/Digitalocean-Wordpress-With-Terraform-Ansible-DynamicInventory.git



2. Create a file named `terraform.tfvars` in the root of the project and set your DigitalOcean API token:

```hcl
do_token = "YOUR_DIGITALOCEAN_API_TOKEN"

    Customize other variables in the variables.tf file as per your requirements, such as projectname, region, size, image, and username.

    The terraform will create a sshkey and store it in the current project folder.

```
terraform init
terraform plan
terraform apply --auto-approve

## Accessing WordPress

The IP address of the WordPress Droplet can be found in a file with the  <projectname>-IP-Address after the Terraform deployment is finished. Use the WordPress server at this IP address. Run the primary play book from the Ansible Directory.This will configure the mysql root password, install the required packages, delete the test database, and other things. After that, launch the wordpress.yml playbook to install WordPress.

```
ansible-playbook -i inventory main.yml
ansible-playbook -i inventory wordpress.yml
```

## Dynamic Inventory for Ansible

This project utilizes a dynamic inventory for Ansible, automatically fetching the IP address of the newly created Droplet from DigitalOcean. The inventory file is generated as ../Ansible/inventory, relative to the project root.
## Customizing Ansible Configuration

If you want to customize the Ansible playbook or configurations, navigate to the ../Ansible/ directory and modify the necessary files accordingly.
Ansible varfile ``` variables.yml``` contains the ansibele variable for mysql , domain name, Mysqlpassword etc.

## Contributing

Contributions to this project are welcome! If you find any issues or have improvements, feel free to open an issue or submit a pull request.
License

This project is licensed under the GNU General Public License v3.0.

