# Función para verificar el estado de la instalación del rol
function Test-FeatureInstallationStatus {
    $feature = Get-WindowsFeature -Name AD-Domain-Services
    return $feature.Installed
}

function instalarActiveDirectoryDS {
    # Verificar si el rol de Active Directory Domain Services ya está instalado
    if (-not (Test-FeatureInstallationStatus)) {
        # Instalar el rol de Active Directory Domain Services
        Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

        # Bucle while para esperar hasta que la instalación se complete
        while (-not (Test-FeatureInstallationStatus)) {
            Write-Host "Esperando a que la instalación de AD-Domain-Services se complete..."
            Start-Sleep -Seconds 10
        }

        Write-Host "La instalación de AD-Domain-Services ha terminado."
        # Pausar la consola hasta que el usuario presione Enter
        Read-Host -Prompt "Presione Enter para continuar con la configuración del dominio"

        # Configurar el servidor como controlador de dominio
        $domainName = Read-Host -Prompt "Escribe el nombre de dominio (ejemplo: semita.sv)"
        $domainNetbiosName = Read-Host -Prompt "Escribe el NetBIOS del dominio (ejemplo: SEMITA)"
        $forestMode = "Win2016"  # Ajusta según la versión de Windows Server
        $domainMode = "Win2016"  # Ajusta según la versión de Windows Server
        $dnsInstall = $true
        $reboot = $true
        $passwordAdminAD_DS = Read-Host -Prompt "Escribe la contraseña del Administrador de dominio"

        Install-ADDSForest `
            -DomainName $domainName `
            -DomainNetbiosName $domainNetbiosName `
            -ForestMode $forestMode `
            -DomainMode $domainMode `
            -InstallDns $dnsInstall `
            -CreateDnsDelegation:$false `
            -NoRebootOnCompletion:$reboot `
            -Force `
            -SafeModeAdministratorPassword (ConvertTo-SecureString $passwordAdminAD_DS -AsPlainText -Force)
    } else {
        Write-Host "Active Directory Domain Services ya está instalado."
        # En caso de que esté instalado, solo se sale de la función
        Read-Host -Prompt "Presione Enter para salir"
        return
    }
}

# Invoca la función para iniciar el programa
instalarActiveDirectoryDS
