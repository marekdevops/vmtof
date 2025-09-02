variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_server" {}
variable "datacenter" {}
variable "datastore" {}
variable "cluster" {}
variable "network" {}
variable "template" {}
variable "vm_count" {
  description = "Liczba maszyn wirtualnych do utworzenia"
  type        = number
  default     = 5
}
variable "vm_prefix" {
  description = "Prefiks dla nazw maszyn wirtualnych"
  type        = string
  default     = "cloned"
}
variable "vm_domain" {
  description = "Domena dla FQDN maszyn wirtualnych"
  type        = string
  default     = "example.com.pl"
}
