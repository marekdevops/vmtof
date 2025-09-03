# PRZED: prod.tfvars (aktualne)
vsphere_user     = "administrator@vsphere.local"
vsphere_password = "yourpassword"
vsphere_server   = "vcenter.domain.local"
datacenter       = "DC01"
datastore        = "datastore1"
cluster          = "Cluster1"
network          = "VM Network"
template         = "ubuntu-template"
vm_count         = 5
vm_prefix        = "cloned"
vm_domain        = "example.com.pl"
iso_path         = ""  # ← BRAK ISO

# PO: prod.tfvars (po zmianie)
vsphere_user     = "administrator@vsphere.local"
vsphere_password = "yourpassword"
vsphere_server   = "vcenter.domain.local"
datacenter       = "DC01"
datastore        = "datastore1"
cluster          = "Cluster1"
network          = "VM Network"
template         = "ubuntu-template"
vm_count         = 5
vm_prefix        = "cloned"
vm_domain        = "example.com.pl"
iso_path         = "iso/ubuntu-22.04.3-desktop-amd64.iso"  # ← DODANE ISO
