variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_server" {}
variable "datacenter" {}
variable "datastore" {}
variable "cluster" {}
variable "network" {}

variable "app_template" {
  description = "Nazwa template dla maszyn aplikacyjnych"
  type        = string
  default     = null
}

variable "db_template" {
  description = "Nazwa template dla maszyn bazodanowych"
  type        = string
  default     = null
}

variable "appwww_template" {
  description = "Nazwa template dla maszyn webowych"
  type        = string
  default     = null
}

variable "app_count" {
  description = "Liczba maszyn aplikacyjnych do utworzenia"
  type        = number
  default     = 0
}

variable "db_count" {
  description = "Liczba maszyn bazodanowych do utworzenia"
  type        = number
  default     = 0
}

variable "appwww_count" {
  description = "Liczba maszyn webowych do utworzenia"
  type        = number
  default     = 0
}

variable "app_prefix" {
  description = "Prefiks dla nazw maszyn aplikacyjnych"
  type        = string
  default     = "app"
}

variable "db_prefix" {
  description = "Prefiks dla nazw maszyn bazodanowych"
  type        = string
  default     = "db"
}

variable "appwww_prefix" {
  description = "Prefiks dla nazw maszyn webowych"
  type        = string
  default     = "appwww"
}

variable "vm_domain" {
  description = "Domena dla FQDN maszyn wirtualnych"
  type        = string
  default     = "example.com.pl"
}

variable "iso_path" {
  description = "Ścieżka do pliku ISO na datastore (opcjonalne)"
  type        = string
  default     = ""
}
