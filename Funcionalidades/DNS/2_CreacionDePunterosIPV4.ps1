function creacionPunterosIP4{

Clear-Host

Write-Output "Configurando Punteros IPv4"
#Zonas de resolucion
Add-DnsServerPrimaryZone -NetworkID 172.16.0.0/24 -ZoneFile 0.0.16.172.in-addr.arpa.dns
#Hosts
Add-DnsServerResourceRecordA -Name www -ZoneName horchata.sv -AllowUpdateAny -IPv4Address 172.16.0.2 -CreatePtr
Add-DnsServerResourceRecordA -Name dns -ZoneName horchata.sv -AllowUpdateAny -IPv4Address 172.16.0.2 -CreatePtr
Add-DnsServerResourceRecordA -Name Anfitrion -ZoneName horchata.sv -AllowUpdateAny -IPv4Address 172.16.0.4 -CreatePtr
Add-DnsServerResourceRecordA -Name Guevara -ZoneName horchata.sv -AllowUpdateAny -IPv4Address 172.16.0.21 -CreatePtr
Add-DnsServerResourceRecordA -Name Aguilar -ZoneName horchata.sv -AllowUpdateAny -IPv4Address 172.16.0.22 -CreatePtr
Add-DnsServerResourceRecordA -Name Herrera -ZoneName horchata.sv -AllowUpdateAny -IPv4Address 172.16.0.23 -CreatePtr
Add-DnsServerResourceRecordA -Name Duran -ZoneName horchata.sv -AllowUpdateAny -IPv4Address 172.16.0.24 -CreatePtr
Add-DnsServerResourceRecordA -Name cliente -ZoneName horchata.sv -AllowUpdateAny -IPv4Address 172.16.0.25 -CreatePtr

Start-Sleep -Seconds 3
.\Funcionalidades\DNS\menuDNS.ps1
}
creacionPunterosIP4