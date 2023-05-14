# Dit is het startupplan van onze opdracht

# Debian wordpress webserver

Download de Debian desktop (64bit)  
https://www.osboxes.org/debian/

Extract deze zip en plaats de .vdi file in  
`C:\VDI Files\Debian`  

Open nu een terminal en voer het `DebianV.ps1` script uit  

Log in op de virtuele machine met `osboxes.org`  

Download het debian.sh script van: 

geef het script execute permissions: `sudo chmod +x debian.sh`
voer het script uit met sudo: `sudo ./debian.sh`

De database settings zijn al door gegeven aan wordpress via  
de wp-config.php file.

Ga nu naar `localhost` en vervolledig de installatie met

`Pieter`  
`Pieter`  
`Pieter`  
`Pieter.deconinck@student.hogent.be`  

# Kali VM

Download de Debian desktop (64bit)  
https://www.osboxes.org/kali-linux/

Extract deze zip en plaats de .vdi file in  
`C:\VDI Files\Kali`  

Open nu een terminal en voer het `EvilKali.ps1` script uit  

Log in op de virtuele machine met `osboxes.org`  




# Extra command in case of already used UUID

`VBoxManage internalcommands sethduuid "C:\VDI Files\Debian\Debian 11 (64bit).vdi"`

`VBoxManage internalcommands sethduuid "C:\VDI Files\Kali\Kali Linux 2022.3 (64bit).vdi"`