function confDHCP {
    Import-Module DhcpServer

    # Configuración IPV4
    $dnsName = "dhcp-horchata.sv"
    $ipv4Address = "172.16.0.2"
    $ipv4StartRange = "172.16.0.50"
    $ipv4EndRange = "172.16.0.100"
    $subnetMask = "255.255.255.0"
    
    Write-Host "Configurando DHCP para IPv4..."
    Add-DhcpServerInDC -DnsName $dnsName -IPAddress $ipv4Address
    Add-DhcpServerv4Scope -Name "RangoIPV4" -StartRange $ipv4StartRange -EndRange $ipv4EndRange -SubnetMask $subnetMask -State Active
    Set-DhcpServerv4OptionValue -DnsServer $ipv4Address -ScopeId "172.16.0.0" -OptionId 006 # Especifica el Servidor DNS a Apuntar
    Restart-Service dhcpserver

}

# Llamada a la función
confDHCP
