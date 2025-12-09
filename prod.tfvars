vsphere_user     = "administrator@vsphere.local"
vsphere_password = "yourpassword"
vsphere_server   = "vcenter.domain.local"
datacenter       = "DC01"
datastore        = "datastore1"
cluster          = "Cluster1"
network          = "VM Network"

# Template dla maszyn aplikacyjnych
app_template     = "ubuntu-app-template"
# Template dla maszyn bazodanowych
db_template      = "ubuntu-db-template"
# Template dla maszyn webowych
appwww_template  = "ubuntu-www-template"

# Liczba maszyn każdego typu
app_count        = 3
db_count         = 3
appwww_count     = 3

# Prefiksy dla nazw maszyn
app_prefix       = "app"
db_prefix        = "db"
appwww_prefix    = "appwww"

vm_domain        = "example.com.pl"

# Przykład: iso_path = "iso/ubuntu-22.04.3-desktop-amd64.iso"
iso_path         = ""
