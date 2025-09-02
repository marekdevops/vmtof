output "vm_ips" {
  description = "Adresy IP wszystkich utworzonych maszyn"
  value       = vsphere_virtual_machine.cloned_vm[*].default_ip_address
}

output "vm_names" {
  description = "Nazwy wszystkich utworzonych maszyn"
  value       = vsphere_virtual_machine.cloned_vm[*].name
}
