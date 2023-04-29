############################################
## Matthias Appelmans / Pieter De Koninck ##
############################################
##  CYBERSECURITY AUTOMATED INSTALLATION  ##
############################################

## VBOX Manage ##


function modify_vm {

    $vmPath = "C:\Users\$($env:UserName)\VirtualBox VMs\"
    $vmName = "Test123"
    $hdSizeMb = 4096
    $isoPath = "C:\ISO Files"
   
    
    VBoxManage createmedium --filename $vmPath\$($vmName).vdi --size $hdSizeMb 2> $null

    VBoxManage storagectl    $vmName --name       'SATA Controller' --add sata --controller IntelAhci
    VBoxManage storageattach $vmName --storagectl 'SATA Controller' --port 0 --device 0 --type hdd --medium  $vmPath/$vmName.vdi

    VBoxManage storagectl    $vmName --name       'IDE Controller' --add ide
    VBoxManage storageattach $vmName --storagectl 'IDE Controller' --port 0 --device 0 --type dvddrive --medium $isoPath

    VBoxManage modifyvm $vmName --ioapic on

    VBoxManage modifyvm $vmName --boot1 dvd --boot2 disk --boot3 none --boot4 none

    VBoxManage modifyvm $vmName --memory 4096 --vram 1048

    VBoxManage modifyvm $vmName --cpus 4

    VBoxManage modifyvm $vmName --nic1 bridged

    VBoxManage modifyvm $vmName --clipboard-mode bidirectional

    VBoxManage modifyvm $vmName --graphicscontroller vboxsvga

}

$vmPath = "C:\Users\$($env:UserName)\VirtualBox VMs\"
$vmName = "DebianBad"

vboxmanage createvm --name $vmName --basefolder=$vmPath --register 2> $null

modify_vm