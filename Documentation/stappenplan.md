# Deployment handleiding

## 1. VM's opzetten

- Download de Debian 11 Desktop 64 bit image van https://www.osboxes.org/debian/
- Download de Kali Linux 2022.3 (All Tools) 64 bit van https://www.osboxes.org/kali-linux/
- Maak een map aan op de C: schijf genaaamd "VDI Files"
- Maak in C:\VDI Files\ 2 mappen aan genaamd "Debian" & "Kali"
- Pak de bestanden uit in hun respectivelijke mappen zodat je **"C:\VDI Files\Debian\Debian 11 (64bit).vdi"** en **"C:\VDI Files\Kali\Kali Linux 2022.3 (64bit).vdi"** bekomt.
- Open een terminal op de plek van de DebianV.ps1 & EvilKali.ps1
- Vraag eerst je execution policy op met `Get-ExecutionPolicy` als deze niet op **unrestricted** staat voer dan dit commando uit: `Set-ExecutionPolicy Unrestricted`
- Run daarna de scripts 1 voor 1 met `.\DebianV.ps1` en `.\EvilKali.ps1`

**Verwachte output zou zijn:**

    0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
    Medium created. UUID: 01e399a0-ad51-49da-9cdc-5281f3db79ea

    Waiting for VM "DebianV" to power on...

    VM "DebianV" has been successfully started.

En hetzelfde voor de Kali uiteraard.

## 2. VM setup

- Juiste folders aanmaken
- Kali en Debian in de juiste folders zetten (gebruk cd of open terminal in correcte folders)
- naar het bash script gaan en beiden uitvoeren
- in de Debian desktop: sudo wget https://raw.githubusercontent.com/Pieter-Deconinck/Cybersec-Matthi-Pieter/main/Bash%20scripts/debian.sh en geef daarna perms via `sudo chmod +x debian.sh`
- Voer daarna script uit: `./debian.sh`
- in de kali desktop: sudo wget https://raw.githubusercontent.com/Pieter-Deconinck/Cybersec-Matthi-Pieter/main/Bash%20scripts/kali.sh en geef daarna perms via `sudo chmod +x kali.sh`
- Geef juiste perms `sudo chmod +x kali.sh`
- Voer script uit `./kali.sh`

## 3. Misbruik de vulnurability
