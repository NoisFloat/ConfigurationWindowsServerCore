function Test-isInstalledDHCPServer{
    $caracteristica = Get-WindowsFeature -Name DHCP
    return $caracteristica.Installed
}
function instalarDHCPServer{
    #Verificar la instalacion de DHCP Server
    if(-not (Test-isInstalledDHCPServer)){
        Install-WindowsFeature -Name DHCP -IncludeManagementTools -IncludeAllSubFeature -Confirm:$false
        while (-not (Test-isInstalledDHCPServer)) {
            Write-Host "Esperando a que la instalación de AD-Domain-Services se complete..."
            Start-Sleep -Seconds 5
        }
    }else{
        Write-Host "El Servidor DHCP ya está instalado."
        # En caso de que esté instalado, solo se sale de la función
        Read-Host -Prompt "Presione Enter para salir"
        return
    }
    
}
instalarDHCPServer