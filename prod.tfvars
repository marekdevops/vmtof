vsphere_user     = "administrator@vsphere.local"
vsphere_password = "yourpassword"
vsphere_server   = "vcenter.domain.local"
datacenter       = "DC01"
datastore        = "datastore1"
cluster          = "Cluster1"
network          = "VM Network"

# Template dla maszyn master
master_template  = "ubuntu-master-template"
# Template dla maszyn infra
infra_template   = "ubuntu-infra-template"
# Template dla maszyn worker
worker_template  = "ubuntu-worker-template"

# Liczba maszyn każdego typu
master_count     = 3
infra_count      = 3
worker_count     = 3

# Prefiksy dla nazw maszyn
master_prefix    = "master"
infra_prefix     = "infra"
worker_prefix    = "worker"

vm_domain        = "example.com.pl"
vm_folder        = "MyVMs"

# Przykład: iso_path = "iso/ubuntu-22.04.3-desktop-amd64.iso"
iso_path         = ""
