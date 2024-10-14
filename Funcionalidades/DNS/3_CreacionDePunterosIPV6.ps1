function creacionPunterosIP6{

Clear-Host
Write-Output "Configurando punteros IPV6"
#Zonas de resolucion
Add-DnsServerPrimaryZone -NetworkID 2001:DB8:DEA:B::0/64 -ZoneFile 0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.b.0.0.0.a.e.d.0.8.b.d.0.1.0.0.2.ip6.arpa.dns
#Hosts
Add-DnsServerResourceRecordAAAA -Name dns -ZoneName horchata.sv -AllowUpdateAny -IPv6Address 2001:db8:dea:b:0:0:0:2 -CreatePtr
Add-DnsServerResourceRecordAAAA -Name www -ZoneName horchata.sv -AllowUpdateAny -IPv6Address 2001:db8:dea:b:0:0:0:2 -CreatePtr
Add-DnsServerResourceRecordAAAA -Name Anfitrion -ZoneName horchata.sv -AllowUpdateAny -IPv6Address 2001:db8:dea:b:0:0:0:4 -CreatePtr
Add-DnsServerResourceRecordAAAA -Name Guevara -ZoneName horchata.sv -AllowUpdateAny -IPv6Address 2001:db8:dea:b:0:0:0:21 -CreatePtr
Add-DnsServerResourceRecordAAAA -Name Aguilar -ZoneName horchata.sv -AllowUpdateAny -IPv6Address 2001:db8:dea:b:0:0:0:22 -CreatePtr
Add-DnsServerResourceRecordAAAA -Name Herrera -ZoneName horchata.sv -AllowUpdateAny -IPv6Address 2001:db8:dea:b:0:0:0:23 -CreatePtr
Add-DnsServerResourceRecordAAAA -Name Duran -ZoneName horchata.sv -AllowUpdateAny -IPv6Address 2001:db8:dea:b:0:0:0:24 -CreatePtr
Add-DnsServerResourceRecordAAAA -Name cliente -ZoneName horchata.sv -AllowUpdateAny -IPv6Address 2001:db8:dea:b:0:0:0:25 -CreatePtr


Start-Sleep -Seconds 3
.\Funcionalidades\DNS\menuDNS.ps1
}
creacionPunterosIP4