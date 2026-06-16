variable "name" {
  description = "VM name"
  type        = string
}

variable "vm_id" {
  description = "Proxmox VM ID — must be unique across the cluster"
  type        = number
}

variable "proxmox_node" {
  description = "Proxmox node to create this VM on"
  type        = string
}

variable "ip_address" {
  description = "Static IPv4 address without prefix length (e.g. 10.0.10.10)"
  type        = string
}

variable "cpu_cores" {
  description = "Number of vCPUs"
  type        = number
}

variable "memory_mb" {
  description = "RAM in megabytes"
  type        = number
}

variable "disk_size" {
  description = "Disk size in gigabytes"
  type        = number
}

variable "role" {
  description = "Node role — used as a Proxmox tag (control-plane or worker)"
  type        = string
}

variable "template_vm_id" {
  description = "VM ID of the Ubuntu 24.04 cloud-init template to clone"
  type        = number
}

variable "datastore_id" {
  description = "Proxmox storage pool for the VM disk"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key injected via cloud-init"
  type        = string
}

variable "gateway" {
  description = "Default gateway"
  type        = string
}

variable "dns_server" {
  description = "DNS server"
  type        = string
}
