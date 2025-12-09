variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_server" {}
variable "datacenter" {}
variable "datastore" {}
variable "cluster" {}
variable "network" {}

variable "master_template" {
  description = "Nazwa template dla maszyn master"
  type        = string
  default     = null
}

variable "infra_template" {
  description = "Nazwa template dla maszyn infra"
  type        = string
  default     = null
}

variable "worker_template" {
  description = "Nazwa template dla maszyn worker"
  type        = string
  default     = null
}

variable "master_count" {
  description = "Liczba maszyn master do utworzenia"
  type        = number
  default     = 0
}

variable "infra_count" {
  description = "Liczba maszyn infra do utworzenia"
  type        = number
  default     = 0
}

variable "worker_count" {
  description = "Liczba maszyn worker do utworzenia"
  type        = number
  default     = 0
}

variable "master_prefix" {
  description = "Prefiks dla nazw maszyn master"
  type        = string
  default     = "master"
}

variable "infra_prefix" {
  description = "Prefiks dla nazw maszyn infra"
  type        = string
  default     = "infra"
}

variable "worker_prefix" {
  description = "Prefiks dla nazw maszyn worker"
  type        = string
  default     = "worker"
}

variable "vm_domain" {
  description = "Domena dla FQDN maszyn wirtualnych"
  type        = string
  default     = "example.com.pl"
}

variable "vm_folder" {
  description = "Folder w vCenter gdzie zostaną umieszczone maszyny wirtualne"
  type        = string
  default     = ""
}

variable "iso_path" {
  description = "Ścieżka do pliku ISO na datastore (opcjonalne)"
  type        = string
  default     = ""
}
