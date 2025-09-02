# Przykład konfiguracji z for_each dla różnych VM
variable "vm_configs" {
  description = "Mapa konfiguracji maszyn wirtualnych"
  type = map(object({
    cpu       = number
    memory    = number
    disk_size = number
    tags      = list(string)
  }))
  default = {
    "web-server-01" = {
      cpu       = 2
      memory    = 4096
      disk_size = 50
      tags      = ["web", "production"]
    }
    "web-server-02" = {
      cpu       = 2
      memory    = 4096
      disk_size = 50
      tags      = ["web", "production"]
    }
    "db-server-01" = {
      cpu       = 4
      memory    = 8192
      disk_size = 100
      tags      = ["database", "production"]
    }
    "app-server-01" = {
      cpu       = 2
      memory    = 4096
      disk_size = 50
      tags      = ["application", "production"]
    }
    "app-server-02" = {
      cpu       = 2
      memory    = 4096
      disk_size = 50
      tags      = ["application", "production"]
    }
  }
}
