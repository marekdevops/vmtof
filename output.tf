output "app_vm_ips" {
  description = "Adresy IP maszyn aplikacyjnych"
  value       = vsphere_virtual_machine.app_vms[*].default_ip_address
}

output "app_vm_names" {
  description = "Nazwy maszyn aplikacyjnych"
  value       = vsphere_virtual_machine.app_vms[*].name
}

output "db_vm_ips" {
  description = "Adresy IP maszyn bazodanowych"
  value       = vsphere_virtual_machine.db_vms[*].default_ip_address
}

output "db_vm_names" {
  description = "Nazwy maszyn bazodanowych"
  value       = vsphere_virtual_machine.db_vms[*].name
}

output "appwww_vm_ips" {
  description = "Adresy IP maszyn webowych"
  value       = vsphere_virtual_machine.appwww_vms[*].default_ip_address
}

output "appwww_vm_names" {
  description = "Nazwy maszyn webowych"
  value       = vsphere_virtual_machine.appwww_vms[*].name
}

output "all_vm_names" {
  description = "Nazwy wszystkich utworzonych maszyn"
  value       = concat(vsphere_virtual_machine.app_vms[*].name, vsphere_virtual_machine.db_vms[*].name, vsphere_virtual_machine.appwww_vms[*].name)
}
