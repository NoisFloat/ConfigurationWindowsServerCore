# Cargar el módulo de Active Directory (si aún no está cargado)
Import-Module ActiveDirectory

function creacionDeUsuariosCatedra {
    Read-Host -Prompt "Presiona Enter para Continuar...."

    Start-Sleep -Seconds 2

    # Crear usuarios
    New-ADUser -Name "Shaki Mebarack" `
        -GivenName "Shaki" `
        -Surname "Barack" `
        -SamAccountName "shaki.mebarack" `
        -UserPrincipalName "shaki.mebarack@horchata.sv" `
        -Path "OU=Compras,OU=Departamento Comercial,OU=Gerencia General,DC=horchata,DC=sv" `
        -AccountPassword (ConvertTo-SecureString "Factura23" -AsPlainText -Force) `
        -Enabled $true `
        -Description "Usuario creado para el departamento de compras."

    Set-ADUser -Identity "shaki.mebarack" -EmailAddress "shaki.mebarack@horchata.sv"

    Start-Sleep -Seconds 2

    New-ADUser -Name "Rosalia Tabela" `
        -GivenName "Rosalia" `
        -Surname "Tabela" `
        -SamAccountName "rosalia.tabela" `
        -UserPrincipalName "rosalia.tabela@horchata.sv" `
        -Path "OU=Compras,OU=Departamento Comercial,OU=Gerencia General,DC=horchata,DC=sv" `
        -AccountPassword (ConvertTo-SecureString "Motomami23" -AsPlainText -Force) `
        -Enabled $true `
        -Description "Usuario creado para el departamento de compras."

    Set-ADUser -Identity "rosalia.tabela" -EmailAddress "rosalia.tabela@horchata.sv"

    Start-Sleep -Seconds 2

    New-ADUser -Name "Estudiante01" `
        -GivenName "Estudiante" `
        -Surname "01" `
        -SamAccountName "estudiante01" `
        -UserPrincipalName "estudiante01@horchata.sv" `
        -Path "OU=Ventas,OU=Departamento Comercial,OU=Gerencia General,DC=horchata,DC=sv" `
        -AccountPassword (ConvertTo-SecureString "Password01" -AsPlainText -Force) `
        -Enabled $true `
        -Description "Usuario creado para fines de prueba."

    Set-ADUser -Identity "estudiante01" -EmailAddress "estudiante01@horchata.sv"

    Start-Sleep -Seconds 2

    New-ADUser -Name "Estudiante02" `
        -GivenName "Estudiante" `
        -Surname "Dos" `
        -SamAccountName "estudiante02" `
        -UserPrincipalName "estudiante02@horchata.sv" `
        -Path "OU=Ventas,OU=Departamento Comercial,OU=Gerencia General,DC=horchata,DC=sv" `
        -AccountPassword (ConvertTo-SecureString "Password02" -AsPlainText -Force) `
        -Enabled $true `
        -Description "Usuario creado como estudiante para el departamento de compras."

    Set-ADUser -Identity "estudiante02" -EmailAddress "estudiante02@horchata.sv"

    Start-Sleep -Seconds 2

    New-ADUser -Name "Yanira Berrios" `
        -GivenName "Yanira" `
        -Surname "Berrios" `
        -SamAccountName "yanira.berrios" `
        -UserPrincipalName "yanira.berrios@horchata.sv" `
        -Path "OU=Diseño,OU=Departamento Comercial,OU=Gerencia General,DC=horchata,DC=sv" `
        -AccountPassword (ConvertTo-SecureString "Corazonbello" -AsPlainText -Force) `
        -Enabled $true `
        -Description "Usuario creado para Yanira Berrios en el departamento de compras."

    Set-ADUser -Identity "yanira.berrios" -EmailAddress "yanira.berrios@horchata.sv"

    Start-Sleep -Seconds 2

    New-ADUser -Name "Estudiante04" `
        -GivenName "Estudiante" `
        -Surname "04" `
        -SamAccountName "estudiante04" `
        -UserPrincipalName "estudiante04@horchata.sv" `
        -Path "OU=Diseño,OU=Departamento Comercial,OU=Gerencia General,DC=horchata,DC=sv" `
        -AccountPassword (ConvertTo-SecureString "Password04" -AsPlainText -Force) `
        -Enabled $true `
        -Description "Usuario creado para Estudiante04 en el departamento de compras."

    Set-ADUser -Identity "estudiante04" -EmailAddress "estudiante04@horchata.sv"

    Start-Sleep -Seconds 2

    Read-Host -Prompt "Tus Usuarios han sido creados, regresando al menu. Presiona Enter..."
    Start-Sleep -Seconds 2
    ../mainScript.ps1
}

# Llamar a la función
creacionDeUsuariosCatedra
