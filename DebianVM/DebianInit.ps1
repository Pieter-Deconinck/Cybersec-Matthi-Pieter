############################################
## Matthias Appelmans / Pieter Deconinck ##
############################################
##  CYBERSECURITY AUTOMATED INSTALLATION  ##
############################################

## MACHINE NAME =  VulDebian

VBoxManage createvm --name VulDebian --ostype Debian --register
VBoxManage modifyvm VulDebian --memory 4096 --cpus 4
VBoxManage modifyvm VulDebian --ioapic on
VboxManage modifyvm VulDebian --vram=512
VBoxManage modifyvm VulDebian --nic1 bridged --bridgeadapter1 "$(wmic nic where NetEnabled=true get DeviceID | findstr /r /c:\"[0-9]*\")"

VBoxManage createhd --filename VirtualBox\ VMs/VulDebian/VulDebian.vdi --size 25000 --format VDI
VBoxManage storagectl VulDebian --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach VulDebian --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium VirtualBox\ VMs/VulDebian/VulDebian.vdi 
VBoxManage storagectl VulDebian --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach VulDebian --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium "C:\ISO Files\debian-11.7.0-i386-netinst.iso"
VBoxHeadless --startvm VulDebian