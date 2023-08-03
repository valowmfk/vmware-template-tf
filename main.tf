terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.4.1"
    }
  }
}

provider "vsphere" {
  user                  = var.vsphere_user
  password              = var.vsphere_password
  vsphere_server        = var.vsphere_vcenter
  allow_unverified_ssl  = true
}

locals {
  templatevars = {
    name         = var.name,
  }
}

# Define VMware vSphere 
data "vsphere_datacenter" "dc" {
  name = var.vsphere-datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vm-datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere-cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vm-network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "/${var.vsphere-datacenter}/vm/${var.vsphere-template-folder}/${var.vm-template-name}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  for_each         = var.vms
  name             = each.value.name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus             = var.cpu
  num_cores_per_socket = var.cores-per-socket
  memory               = var.ram
  guest_id             = var.vm-guest-id

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "${var.name}-disk"
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    #size             = var.disksize == "50" ? data.vsphere_virtual_machine.template.disks.0.size : var.disksize 
    size             = 48
  }

  clone {
    template_uuid       = data.vsphere_virtual_machine.template.id
    timeout             = 60
    customize {
      linux_options {
        host_name       = each.value.name
        domain      		= var.vm_domain
      }
    network_interface {
      }
    }
  }
}
