############################################
## Matthias Appelmans / Pieter Deconinck ##
############################################
##  CYBERSECURITY AUTOMATED INSTALLATION  ##
############################################

## MACHINE NAME =  EvilKali


$VM_NAME = "EvilKali"
$VM_HD_PATH = "C:\VDI Files\Kali\Kali Linux 2022.3 (32bit).vdi"
VBoxManage startvm $VM_NAME --type gui

VBoxManage createvm --name $VM_NAME --ostype KaliLinux --register

vboxmanage createmedium disk --filename "C:\Users\matth\VirtualBox VMs\EvilKali\EvilKali" --size 20480 --format VDI


VBoxManage storagectl ${VM_NAME} --name "SATA Controller" --add sata --controller IntelAHCI

VBoxManage storageattach ${VM_NAME} --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium ${VM_HD_PATH}

vboxmanage modifyvm $VM_NAME --ioapic on
vboxmanage modifyvm $VM_NAME --memory 4096 --vram 64
vboxmanage modifyvm $VM_NAME --nic1 nat
VBoxManage modifyvm $VM_NAME --nic2 intnet

VBoxManage startvm $VM_NAME --type gui
