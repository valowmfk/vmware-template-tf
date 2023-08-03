#===========================#
# VMware vCenter connection #
#===========================#

variable "vsphere_user" {
  type        = string
  description = "VMware vSphere user name"
  default     = ""
}

variable "vsphere_password" {
  type        = string
  description = "VMware vSphere password"
  sensitive   = true
}

variable "vsphere_vcenter" {
  type        = string
  description = "VMWare vCenter server FQDN / IP"
  default     = ""
}

variable "vsphere-unverified-ssl" {
  type        = string
  description = "Is the VMware vCenter using a self signed certificate (true/false)"
  default     = "true"
}

variable "vsphere-datacenter" {
  type        = string
  description = "VMWare vSphere datacenter"
  default     = ""
}

variable "vsphere-cluster" {
  type        = string
  description = "VMWare vSphere cluster"
  default     = ""
}

variable "vsphere-template-folder" {
  type        = string
  description = "Template folder"
  default     = "Templates"
}

#================================#
# VMware vSphere virtual machine #
#================================#

variable "name" {
  type        = string
  description = "The name of the vSphere virtual machines and the hostname of the machine"
  default     = ""
}

variable "vm-name-prefix" {
  type        = string
  description = "Name of VM prefix"
  default     =  ""
}

variable "vm-datastore" {
  type        = string
  description = "Datastore used for the vSphere virtual machines"
  default     = "dumpstation"
}

variable "vm-network" {
  type        = string
  description = "Network used for the vSphere virtual machines"
  default     = "Lab-30"
}

variable "vm-linked-clone" {
  type        = string
  description = "Use linked clone to create the vSphere virtual machine from the template (true/false). If you would like to use the linked clone feature, your template need to have one and only one snapshot"
  default     = "false"
}

variable "cpu" {
  description = "Number of vCPU for the vSphere virtual machines"
  default     = 2
}

variable "cores-per-socket" {
  description = "Number of cores per cpu for workers"
  default     = 1
}

variable "ram" {
  description = "Amount of RAM for the vSphere virtual machines (example: 2048)"
  default     = 4096
}

variable "disksize" {
  description = "Disk size, example 100 for 100 GB"
  default     = 48
}

variable "vm-guest-id" {
  type        = string
  description = "The ID of virtual machines operating system"
  default     = "ubuntu64Guest"
}

variable "vm-template-name" {
  type        = string
  description = "The template to clone to create the VM"
  default     = ""
}

variable "vm-domain" {
  type        = string
  description = "Linux virtual machine domain name for the machine. This, along with host_name, make up the FQDN of the virtual machine"
  default     = ""
}

variable "dns_server_list" {
  type = list(string)
  description = "List of DNS servers"
  default = [""]
}

variable "vms" {
  type = map(any)
  description = "List of virtual machines to be deployed"
}

variable "vm_disk_label" {
  description = "Disk label of the created virtual machine"
}

variable "vm_template_name" {
  description = "VM template with vmware-tools and perl installed"
}

variable "vsphere_datacenter" {
  description = "vSphere datacenter in which the virtual machine will be deployed"
}

variable "vm_domain" {
  description = "Domain name of virtual machine"
  default = "home.klouda.co"
}

variable "ssh_username" {
  type      = string
  sensitive = true
  default   = ""
}

variable "public_key" {
  type        = string
  description = "Public key to be used to ssh into a machine"
  default     = ""
}