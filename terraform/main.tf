module "k3s_vm" {
  source   = "./modules/k3s-vm"
  for_each = var.vms

  name           = each.key
  vm_id          = each.value.vm_id
  proxmox_node   = var.proxmox_node
  ip_address     = each.value.ip_address
  cpu_cores      = each.value.cpu_cores
  memory_mb      = each.value.memory_mb
  disk_size      = each.value.disk_size
  role           = each.value.role
  template_vm_id = var.template_vm_id
  datastore_id   = var.datastore_id
  ssh_public_key = var.ssh_public_key
  gateway        = var.gateway
  dns_server     = var.dns_server
}
