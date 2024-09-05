Add-DnsServerForwarder -IPAddress "8.8.8.8"
Add-DnsServerForwarder -IPAddress "2001:4860:4860::8888"
Add-DnsServerPrimaryZone -Name "example.com" -ZoneFile "example.com.dns" -ZoneScope "Default" -DynamicUpdate "Secure"
Add-DnsServerResourceRecordA -ZoneName "example.com" -Name "www" -IPv4Address "192.168.1.10"
Add-DnsServerResourceRecordAAAA -ZoneName "example.com" -Name "www" -IPv6Address "2001:db8::1"
#GENERAR TABLA PARA VISUALIZAR CONF DNS SERVER
Get-DnsServer
Get-DnsServerForwarder
Get-DnsServerZone -Name "example.com"
Test-DnsServer -ComputerName "localhost"
