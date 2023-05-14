############################################
## Matthias Appelmans / Pieter Deconinck ##
############################################
##  CYBERSECURITY AUTOMATED INSTALLATION  ##
############################################

## MACHINE NAME =  DebianV

$VM_NAME = "DebianV"

VBoxManage createvm --name $VM_NAME --ostype Debian --register

vboxmanage createmedium disk --filename "C:\Users\${env:USERNAME}\VirtualBox VMs\${VM_NAME}\${VM_NAME}" --size 20480 --format VDI


VBoxManage storagectl ${VM_NAME} --name "SATA Controller" --add sata --controller IntelAHCI

VBoxManage storageattach ${VM_NAME} --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "C:\VDI Files\Debian\Debian 11 (64bit).vdi"

vboxmanage modifyvm $VM_NAME --ioapic on
vboxmanage modifyvm $VM_NAME --memory 4096 --vram 64
vboxmanage modifyvm $VM_NAME --nic1 nat
VBoxManage modifyvm $VM_NAME --nic2 intnet
vboxmanage modifyvm $VM_NAME --cpus 4

VBoxManage startvm $VM_NAME --type gui
