provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "cloned_vm" {
  count            = var.vm_count
  name             = "${var.vm_prefix}${count.index}.${var.vm_domain}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = data.vsphere_virtual_machine.template.num_cpus
  memory   = data.vsphere_virtual_machine.template.memory
  guest_id = data.vsphere_virtual_machine.template.guest_id

  enable_disk_uuid = true

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = true
  }

  # CD-ROM z obrazem ISO (jeśli podano)
  cdrom {
    datastore_id = var.iso_path != "" ? data.vsphere_datastore.datastore.id : null
    path         = var.iso_path != "" ? var.iso_path : null
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  # Wyłącz oczekiwanie na VMware Tools
  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0
  
  # Dodatkowe ustawienia dla maszyn bez OS
  wait_for_guest_net_routable = false
  shutdown_wait_timeout       = 3
  
  # Opcjonalnie: ustaw timeout dla całej operacji
  timeouts {
    create = "10m"
    update = "10m"
    delete = "10m"
  }
}
