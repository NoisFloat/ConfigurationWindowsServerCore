function instalacionOU {
    Clear-Host
    Write-Host "Bienvenido al asistente de creación de Unidades Organizativas (OU) en Active Directory."
    Write-Host "Controladores de dominio disponibles para agregar Unidades Organizativas (OUs). Por favor, escribe el nombre del controlador de dominio existente al que deseas agregar las OUs."
    Get-ADDomainController -Filter * | Select-Object -Property Domain

    $continue = Read-Host "¿Deseas continuar? (Si/No): "
    if ($continue -eq "Si") {
        $domainController = Read-Host "Escribe el nombre del Controlador de Dominio (Ejemplo: horchata.sv): "
        $arregloDomainController = $domainController -split '\.'
        
        $domainPath = "DC=$($arregloDomainController[0]),DC=$($arregloDomainController[1])"
        
        New-ADOrganizationalUnit -Name "Gerencia General" -Path $domainPath -Description "Unidad Organizativa Padre"
        Start-Sleep -Seconds 1
        
        New-ADOrganizationalUnit -Name "Departamento Comercial" -Path "OU=Gerencia General,$domainPath" -Description "Unidad Organizativa de Nivel 2"
        Start-Sleep -Seconds 1
        
        New-ADOrganizationalUnit -Name "Compras" -Path "OU=Departamento Comercial,OU=Gerencia General,$domainPath" -Description "Unidad Organizativa de Nivel 3"
        Start-Sleep -Seconds 1
        
        New-ADOrganizationalUnit -Name "Ventas" -Path "OU=Departamento Comercial,OU=Gerencia General,$domainPath" -Description "Unidad Organizativa de Nivel 3"
        Start-Sleep -Seconds 1
        
        New-ADOrganizationalUnit -Name "Diseño" -Path "OU=Departamento Comercial,OU=Gerencia General,$domainPath" -Description "Unidad Organizativa de Nivel 3"
        Start-Sleep -Seconds 1
        
        Write-Host "La creación de las Unidades Organizativas se ha completado con éxito."
    } else {
        Write-Host "Operación cancelada. Presiona Enter Para ir al menú..."
    }
    Read-Host -Prompt "Presiona Enter Para ir al menu..."
    ../mainScript.ps1
}

instalacionOU
