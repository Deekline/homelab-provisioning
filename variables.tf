variable "proxmox_endpoint" {
  description = "Proxmox API URL (e.g. https://10.0.10.31:8006)"
  type        = string
}

variable "proxmox_node" {
  description = "Proxmox node to provision VMs on for this run"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token — format: USER@REALM!TOKENID=SECRET"
  type        = string
  sensitive   = true
}

variable "template_vm_id" {
  description = "VM ID of the Ubuntu 24.04 cloud-init template to clone from"
  type        = number
}

variable "datastore_id" {
  description = "Proxmox storage pool for VM disks"
  type        = string
  default     = "local-lvm"
}

variable "ssh_public_key" {
  description = "SSH public key injected into VMs via cloud-init"
  type        = string
}

variable "gateway" {
  description = "Default gateway for all VMs"
  type        = string
  default     = "10.0.10.1"
}

variable "dns_server" {
  description = "DNS server for all VMs"
  type        = string
  default     = "10.0.10.1"
}

variable "vms" {
  description = "Map of VMs to provision on this node — add or remove entries in terraform.tfvars"
  type = map(object({
    vm_id      = number
    ip_address = string
    cpu_cores  = number
    memory_mb  = number
    disk_size  = number
    role       = string
  }))
}
