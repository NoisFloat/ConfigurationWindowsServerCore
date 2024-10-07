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
    Set-DhcpServerv4OptionValue -DnsServer $ipv4Address  # Especifica el Servidor DNS a Apuntar
    Restart-Service dhcpserver

    #Configuracion IPV6
    #Servicio DHCP
    #Instale y configure los módulos del servicio DHCPv6 bajo las siguientes condiciones:
    #- 2001:DB8:DEA:B:: /64 Dirección de red
    #- 2001:DB8:DEA:B:: 2 Servidor DNS
    #- 2001:DB8:DEA:B:: 100 - 2001:DB8:DEA:B::200 (asignable)

  
    Add-DhcpServerv6Scope -Prefix 2001:DB8:DEA:B:: -Name "IPV6" -State Active
    # Excluir desde el inicio hasta 2001:DB8:DEA:B::99
    # Excluir el rango de direcciones que no deseas asignar
    Add-DhcpServerv6ExclusionRange -Prefix "2001:DB8:DEA:B::" -StartRange "2001:DB8:DEA:B::1" -EndRange "2001:DB8:DEA:B::99"
    Add-DhcpServerv6ExclusionRange -Prefix "2001:DB8:DEA:B::" -StartRange "2001:DB8:DEA:B::201" -EndRange "2001:DB8:DEA:B::FFFF"

   

    Set-DhcpServerv6OptionValue -DnsServer 2001:DB8:DEA:B::2

    Write-Host "Configuracion Finalizada***"
    Write-Host "Regresando al Menu Principal ..."
    Start-Sleep -Seconds 2
    .\mainScript.ps1


}

# Llamada a la función
confDHCP
