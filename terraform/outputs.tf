output "vm_ips" {
  description = "IP addresses of provisioned VMs"
  value = {
    for name, vm in module.k3s_vm : name => vm.ip_address
  }
}

output "vm_ids" {
  description = "Proxmox VM IDs of provisioned VMs"
  value = {
    for name, vm in module.k3s_vm : name => vm.vm_id
  }
}
