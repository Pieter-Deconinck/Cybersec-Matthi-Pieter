############################################
## Matthias Appelmans / Pieter Deconinck ##
############################################
##  CYBERSECURITY AUTOMATED INSTALLATION  ##
############################################

## MACHINE NAME =  DebianV

$VM_NAME = "DebianV"

# Create the VM name and specify Operating system
VBoxManage createvm --name $VM_NAME --ostype Debian_64 --register

# Create the VM Disk and size, were using a disk downloaded from osboxes
vboxmanage createmedium disk --filename "C:\Users\${env:USERNAME}\VirtualBox VMs\${VM_NAME}\${VM_NAME}" --size 20480 --format VDI
VBoxManage storagectl ${VM_NAME} --name "SATA Controller" --add sata --controller IntelAHCI
VBoxManage storageattach ${VM_NAME} --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "C:\VDI Files\Debian\Debian 11 (64bit).vdi"

vboxmanage modifyvm $VM_NAME --ioapic on
vboxmanage modifyvm $VM_NAME --memory 4096 --vram 64
vboxmanage modifyvm $VM_NAME --cpus 4

# Network adapters, Nat voor internet toegang, internal netwerk voor Kali en Debian webserver
vboxmanage modifyvm $VM_NAME --nic1 nat
VBoxManage modifyvm $VM_NAME --nic2 intnet

# Host only adapter zodat je met ssh kan verbinden en je keyboard layout niet uitmaakt.
# VBoxManage modifyvm $VM_NAME --nic3 hostonly --hostonlyadapter1 "VirtualBox Host-Only Ethernet Adapter"


# Start een GUI venster
VBoxManage startvm $VM_NAME --type gui
