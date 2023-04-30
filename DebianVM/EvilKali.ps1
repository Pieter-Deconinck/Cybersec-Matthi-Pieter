############################################
## Matthias Appelmans / Pieter Deconinck ##
############################################
##  CYBERSECURITY AUTOMATED INSTALLATION  ##
############################################

## MACHINE NAME =  EvilKali

VBoxManage createvm --name EvilKali --ostype KaliLinux --register
VBoxManage modifyvm EvilKali --memory 4096 --cpus 4
VBoxManage modifyvm EvilKali --ioapic on
VboxManage modifyvm EvilKali --vram=512
VBoxManage modifyvm EvilKali --nic1 bridged --bridgeadapter1 "$(wmic nic where NetEnabled=true get DeviceID | findstr /r /c:\"[0-9]*\")"
VBoxManage createhd --filename VirtualBox\ VMs/EvilKali/EvilKali.vdi --size 25000 --format VDI
VBoxManage storagectl EvilKali --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach EvilKali --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "C:\VDI Files\Kali\Kali Linux 2022.3 (32bit).vdi"
VBoxManage startvm EvilKali --type gui
