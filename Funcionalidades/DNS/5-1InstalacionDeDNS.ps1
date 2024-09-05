function Test-isInstalledDNSServer{
    $caracteristica = Get-WindowsFeature -Name DNS
    return $caracteristica.Installed
}
function instalacionDNS{
    #Verificar la instalacion de DHCP Server
    if(-not (Test-isInstalledDNSServer)){
        Install-WindowsFeature -Name DNS -IncludeManagementTools -IncludeAllSubFeature       
            Write-Host "Esperando a que la instalación de DNS se complete..."
            Start-Sleep -Seconds 5
        }else{
        Write-Host "El Servidor DNS ya está instalado."
        # En caso de que esté instalado, solo se sale de la función
        Read-Host -Prompt "Presione Enter para salir"
        ../mainScript.ps1
        return
    }
}
instalacionDNS