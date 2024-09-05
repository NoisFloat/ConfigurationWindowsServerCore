# Cargar el módulo de Active Directory (si aún no está cargado)
Import-Module ActiveDirectory

function CreacionDeUsuariosCatedra {
    Read-Host -Prompt "Presiona Enter para Continuar..."

    # Lista de usuarios a crear
    $usuarios = @(
        @{
            Name = "Shaki Mebarack"
            GivenName = "Shaki"
            Surname = "Mebarack"
            SamAccountName = "shaki.mebarack"
            UserPrincipalName = "shaki.mebarack@horchata.sv"
            Path = "OU=Compras,OU=Departamento Comercial,OU=Gerencia General,DC=horchata,DC=sv"
            Password = "Factura23"
            EmailAddress = "shaki.mebarack@horchata.sv"
            Description = "Usuario creado para el departamento de compras."
        },
        @{
            Name = "Rosalia Tabela"
            GivenName = "Rosalia"
            Surname = "Tabela"
            SamAccountName = "rosalia.tabela"
            UserPrincipalName = "rosalia.tabela@horchata.sv"
            Path = "OU=Compras,OU=Departamento Comercial,OU=Gerencia General,DC=horchata,DC=sv"
            Password = "Motomami23"
            EmailAddress = "rosalia.tabela@horchata.sv"
            Description = "Usuario creado para el departamento de compras."
        },
        @{
            Name = "Estudiante01"
            GivenName = "Estudiante"
            Surname = "01"
            SamAccountName = "estudiante01"
            UserPrincipalName = "estudiante01@horchata.sv"
            Path = "OU=Ventas,OU=Departamento Comercial,OU=Gerencia General,DC=horchata,DC=sv"
            Password = "Password01"
            EmailAddress = "estudiante01@horchata.sv"
            Description = "Usuario creado para fines de prueba."
        },
        @{
            Name = "Estudiante02"
            GivenName = "Estudiante"
            Surname = "Dos"
            SamAccountName = "estudiante02"
            UserPrincipalName = "estudiante02@horchata.sv"
            Path = "OU=Ventas,OU=Departamento Comercial,OU=Gerencia General,DC=horchata,DC=sv"
            Password = "Password02"
            EmailAddress = "estudiante02@horchata.sv"
            Description = "Usuario creado como estudiante para el departamento de compras."
        },
        @{
            Name = "Yanira Berrios"
            GivenName = "Yanira"
            Surname = "Berrios"
            SamAccountName = "yanira.berrios"
            UserPrincipalName = "yanira.berrios@horchata.sv"
            Path = "OU=Diseño,OU=Departamento Comercial,OU=Gerencia General,DC=horchata,DC=sv"
            Password = "Corazonbell0#0"
            EmailAddress = "yanira.berrios@horchata.sv"
            Description = "Usuario creado para Yanira Berrios en el departamento de compras."
        },
        @{
            Name = "Estudiante04"
            GivenName = "Estudiante"
            Surname = "04"
            SamAccountName = "estudiante04"
            UserPrincipalName = "estudiante04@horchata.sv"
            Path = "OU=Diseño,OU=Departamento Comercial,OU=Gerencia General,DC=horchata,DC=sv"
            Password = "Password04"
            EmailAddress = "estudiante04@horchata.sv"
            Description = "Usuario creado para Estudiante04 en el departamento de compras."
        }
    )
     
    # Crear usuarios
    foreach ($usuario in $usuarios) {
        Import-Module ActiveDirectory
        New-ADUser -Name $usuario.Name `
            -GivenName $usuario.GivenName `
            -Surname $usuario.Surname `
            -SamAccountName $usuario.SamAccountName `
            -UserPrincipalName $usuario.UserPrincipalName `
            -Path $usuario.Path `
            -AccountPassword (ConvertTo-SecureString $usuario.Password -AsPlainText -Force) `
            -Enabled $true `
            -Description $usuario.Description

        Set-ADUser -Identity $usuario.SamAccountName -EmailAddress $usuario.EmailAddress

        Start-Sleep -Seconds 2
    }

    Read-Host -Prompt "Tus Usuarios han sido creados, regresando al menu. Presiona Enter..."
    Start-Sleep -Seconds 2
    ../mainScript.ps1
}

# Llamar a la función
CreacionDeUsuariosCatedra
