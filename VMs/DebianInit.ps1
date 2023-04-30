############################################
## Matthias Appelmans / Pieter Deconinck ##
############################################
##  CYBERSECURITY AUTOMATED INSTALLATION  ##
############################################

## MACHINE NAME =  VulDebian

VBoxManage createvm --name VulDebian --ostype Debian --register
VBoxManage modifyvm VulDebian --memory 4096 --cpus 4
VBoxManage modifyvm VulDebian --ioapic on
VboxManage modifyvm VulDebian --vram=512$

# Normaal wordt de juiste adapter automatisch gekozen.

VBoxManage modifyvm VulDebian --nic1 bridged --bridgeadapter1 "$(wmic nic where NetEnabled=true get DeviceID | findstr /r /c:\"[0-9]*\")"
VBoxManage createhd --filename VirtualBox\ VMs/VulDebian/VulDebian.vdi --size 25000 --format VDI
VBoxManage storagectl VulDebian --name "SATA Controller" --add sata --controller IntelAhci

# Pas zeker je pad aan naar de VDI file indien nodig.

VBoxManage storageattach VulDebian --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "C:\VDI Files\Debian\Debian 11 (32bit).vdi"
VBoxManage startvm VulDebian --type gui
