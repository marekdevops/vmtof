output "vm_ip" {
  description = "Adres IP nowo utworzonej maszyny"
  value       = vsphere_virtual_machine.cloned_vm.default_ip_address
}
