#
# Add information for your vSphere environment here
#

#Provider
vsphere_user                = ""
vsphere_password            = ""
vsphere_vcenter             = ""

#Infrastructure
vsphere_datacenter          = ""
vsphere-cluster             = ""
vm-datastore                = ""
vm-network                  = ""

#VM
vm_template_name            = ""
vm_guest_id                 = var.vm-guest-id
cpu   	                    = "2"
ram	                        = "4096"
vm_disk_label               = "disk0"
vm_disk_size                = var.disksize

#
# VM and Hostname for each created host. You can add or remove from this list, rename or add additional customization options
#
vms = {
  qk8_control_1 = {
    name                = "qk8-control-1"
  }
  qk8_control_2 = {
    name                = "qk8-control-2"
  }
  qk8_worker_1 = {
    name                = "qk8-worker-1"
  },
  qk8_worker_2 = {
    name                = "qk8-worker-2"
  }
  qk8_worker_3 = {
    name                = "qk8-worker-3"
  }
}