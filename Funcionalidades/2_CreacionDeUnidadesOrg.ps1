function instalacionOU {
    Write-Host "Bienvenido al asistente de creación de Unidades Organizativas (OU) en Active Directory."
    
    $continue = Read-Host "¿Deseas continuar? (S/N): "
    if ($continue -eq "S") {
        Write-Host "Operación cancelada. Saliendo del asistente."
        return
    }else{
        ../mainScript.ps1
    }

    $domainController = Read-Host "Escribe el nombre del Controlador de Dominio (Ejemplo: horchata.sv): "
    $arregloDomainController = $domainController -split '\.'
    New-ADOrganizationalUnit -Name "Gerencia General" -Path "DC=$arregloDomainController[0],DC=$arregloDomainController[1]" -Description "Unidad Organizativa Padre"
    Start-Sleep -Seconds 1
    New-ADOrganizationalUnit -Name "Departamento Comercial" -Path "OU=Gerencia General,DC=$arregloDomainController[0],DC=$arregloDomainController[1]" -Description "Unidad Organizativa de Nivel 2"
    Start-Sleep -Seconds 1
    New-ADOrganizationalUnit -Name "Compras" -Path "OU=Departamento Comercial,OU=Gerencia General,DC=$arregloDomainController[0],DC=$arregloDomainController[1]" -Description "Unidad Organizativa de Nivel 3"
    Start-Sleep -Seconds 1
    New-ADOrganizationalUnit -Name "Ventas" -Path "OU=Departamento Comercial,OU=Gerencia General,DC=$arregloDomainController[0],DC=$arregloDomainController[1]" -Description "Unidad Organizativa de Nivel 3"
    Start-Sleep -Seconds 1
    New-ADOrganizationalUnit -Name "Diseño" -Path "OU=Departamento Comercial,OU=Gerencia General,DC=$arregloDomainController[0],DC=$arregloDomainController[1]" -Description "Unidad Organizativa de Nivel 3"
    Start-Sleep -Seconds 1
    Read-Host -Prompt "Presiona Enter Para ir al menu..."

    Write-Host "La creación de las Unidades Organizativas se ha completado con éxito."
    ../mainScript.ps1

}

instalacionOU



