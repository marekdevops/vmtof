output "master_vm_ips" {
  description = "Adresy IP maszyn master"
  value       = vsphere_virtual_machine.master_vms[*].default_ip_address
}

output "master_vm_names" {
  description = "Nazwy maszyn master"
  value       = vsphere_virtual_machine.master_vms[*].name
}

output "infra_vm_ips" {
  description = "Adresy IP maszyn infra"
  value       = vsphere_virtual_machine.infra_vms[*].default_ip_address
}

output "infra_vm_names" {
  description = "Nazwy maszyn infra"
  value       = vsphere_virtual_machine.infra_vms[*].name
}

output "worker_vm_ips" {
  description = "Adresy IP maszyn worker"
  value       = vsphere_virtual_machine.worker_vms[*].default_ip_address
}

output "worker_vm_names" {
  description = "Nazwy maszyn worker"
  value       = vsphere_virtual_machine.worker_vms[*].name
}

output "all_vm_names" {
  description = "Nazwy wszystkich utworzonych maszyn"
  value       = concat(vsphere_virtual_machine.master_vms[*].name, vsphere_virtual_machine.infra_vms[*].name, vsphere_virtual_machine.worker_vms[*].name)
}
