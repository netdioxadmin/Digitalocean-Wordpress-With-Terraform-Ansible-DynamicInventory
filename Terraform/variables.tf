variable "do_token" {
  default = ""
}

variable "projectname" {
  default = "vaves.in"
}

variable "region" {
  default = "blr1"
}

variable "current_working_dir" {
  type    = string
  default = ""
}

variable "size" {
  default = "s-2vcpu-2gb"

}
variable "image" {
  default = "ubuntu-22-04-x64"
}

variable "username" {
  default = "root"
}