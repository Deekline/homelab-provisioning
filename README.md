# homelab-provisioning

Terraform + Ansible for provisioning and configuring the M910Q k3s cluster nodes.

- `terraform/` — Proxmox VM provisioning (bpg/proxmox provider). Applied once per physical node via `-var-file=nodeN.tfvars`.
- `ansible/` — Node configuration (base OS, NFS mounts, k3s install, kube-vip).

## Secrets

`terraform/secrets.tfvars` is SOPS-encrypted using the **same age key** as `homelab-infra`

