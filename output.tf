output "master_vm_ips" {
  description = "Adresy IP maszyn master"
  value       = vsphere_virtual_machine.master_vms[*].default_ip_address
}

output "master_vm_names" {
  description = "Nazwy maszyn master"
  value       = vsphere_virtual_machine.master_vms[*].name
}

output "master_vm_macs" {
  description = "Adresy MAC maszyn master"
  value       = { for vm in vsphere_virtual_machine.master_vms : vm.name => vm.network_interface[0].mac_address }
}

output "infra_vm_ips" {
  description = "Adresy IP maszyn infra"
  value       = vsphere_virtual_machine.infra_vms[*].default_ip_address
}

output "infra_vm_names" {
  description = "Nazwy maszyn infra"
  value       = vsphere_virtual_machine.infra_vms[*].name
}

output "infra_vm_macs" {
  description = "Adresy MAC maszyn infra"
  value       = { for vm in vsphere_virtual_machine.infra_vms : vm.name => vm.network_interface[0].mac_address }
}

output "worker_vm_ips" {
  description = "Adresy IP maszyn worker"
  value       = vsphere_virtual_machine.worker_vms[*].default_ip_address
}

output "worker_vm_names" {
  description = "Nazwy maszyn worker"
  value       = vsphere_virtual_machine.worker_vms[*].name
}

output "worker_vm_macs" {
  description = "Adresy MAC maszyn worker"
  value       = { for vm in vsphere_virtual_machine.worker_vms : vm.name => vm.network_interface[0].mac_address }
}

output "all_vm_names" {
  description = "Nazwy wszystkich utworzonych maszyn"
  value       = concat(vsphere_virtual_machine.master_vms[*].name, vsphere_virtual_machine.infra_vms[*].name, vsphere_virtual_machine.worker_vms[*].name)
}
