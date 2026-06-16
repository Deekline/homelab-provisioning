output "ip_address" {
  description = "Static IP address of the VM"
  value       = var.ip_address
}

output "vm_id" {
  description = "Proxmox VM ID"
  value       = var.vm_id
}
