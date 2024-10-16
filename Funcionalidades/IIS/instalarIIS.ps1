function Test_IsInstalledIIS_Server {
    $caracteristica = Get-WindowsFeature -Name Web-Server
    return $caracteristica.Installed
}

function Install_IIS_Server {
    Clear-Host
    # Verificar la instalación de DNS Server
    if (-not (Test_IsInstalledIIS_Server)) {
        Install-WindowsFeature -Name Web-Server -IncludeManagementTools -IncludeAllSubFeature -Confirm:$true
        Install-WindowsFeature Web-Mgmt-Service -IncludeManagementTools 

        Install-WindowsFeature Web-Mgmt-Service -IncludeManagementTools 
        Write-Host "Esperando a que la instalación de DNS se complete..."
        Start-Sleep -Seconds 5
    } else {
        Write-Host "El Servidor IIS ya está instalado."
        # En caso de que esté instalado, solo se sale de la función
        Read-Host -Prompt "Presione Enter para salir"
        .\Funcionalidades\IIS\menuIIS.ps1

        return
    }
}
Install_IIS_Server