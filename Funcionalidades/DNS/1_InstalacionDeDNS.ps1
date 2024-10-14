function Test-isInstalledDNSServer{
    $caracteristica = Get-WindowsFeature -Name DNS
    return $caracteristica.Installed
}
function instalacionDNS{
    Clear-Host
    #Verificar la instalacion de DHCP Server
    if(-not (Test-isInstalledDNSServer)){
        Install-WindowsFeature -Name DNS -IncludeManagementTools -IncludeAllSubFeature -Confirm:$false 
            Write-Host "Esperando a que la instalación de DNS se complete..."
            Start-Sleep -Seconds 5
        }else{
        Write-Host "El Servidor DNS ya está instalado."
        # En caso de que esté instalado, solo se sale de la función
        Read-Host -Prompt "Presione Enter para salir"
        .\Funcionalidades\DNS\menuDNS.ps1
        return
    }
}
instalacionDNS