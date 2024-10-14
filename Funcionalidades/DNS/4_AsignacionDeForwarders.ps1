function asignacionForwarders{
Clear-Host
Write-Output "Configurando Forwarders"
Add-DnsServerForwarder -IPAddress 1.1.1.1
Add-DnsServerForwarder -IPAddress 8.8.8.8
Add-DnsServerForwarder -IPAddress 2606:4700:4700::1111 -PassThru
Add-DnsServerForwarder -IPAddress 2606:4700:4700::1001 -PassThru
Start-Sleep -Seconds 3
.\Funcionalidades\DNS\menuDNS.ps1
}
asignacionForwarders
