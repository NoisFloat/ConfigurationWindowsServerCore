function Test_IsInstalledDNSServer {
    $caracteristica = Get-WindowsFeature -Name DNS
    return $caracteristica.Installed
}

function Install_DNSServer {
    Clear-Host
    # Verificar la instalación de DNS Server
    if (-not (Test_IsInstalledDNSServer)) {
        Install-WindowsFeature -Name DNS -IncludeManagementTools -IncludeAllSubFeature -Confirm:$false
        Write-Host "Esperando a que la instalación de DNS se complete..."
        Start-Sleep -Seconds 5
    } else {
        Write-Host "El Servidor DNS ya está instalado."
        # En caso de que esté instalado, solo se sale de la función
        Read-Host -Prompt "Presione Enter para salir"
        .\Funcionalidades\IIS\menuIIS.ps1

        return
    }
}
Install_DNSServer