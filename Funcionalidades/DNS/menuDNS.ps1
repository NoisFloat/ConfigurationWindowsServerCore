function menuDNS {
    Write-Host "**********************"
    Get-Location
    Write-Host "**********************"

    $menu = ''
    while ($menu -ne '0') {
        Clear-Host
        Write-Host ''
        Write-Host ''
        Write-Host '*************************************************************'
        Write-Host '*                  HERRAMIENTAS DEL ACTIVE DIRECTORY       *'
        Write-Host '*==========================================================*'
        Write-Host '*                 Elige una opción del menú:               *'
        Write-Host '*                                                         *'
        Write-Host '*      [1] Instalación de DNS                             *'
        Write-Host '*      [2] Creacion de punteros IPV4(Incluye Inverso)     *'
        Write-Host '*      [3] Creacion de punteros IPV6(Incluye Inverso)     *'
        Write-Host '*      [3] Asignacion de Forwarders (IPV4 - IPV6)         *'                         
        Write-Host '*                                                         *'
        Write-Host '*      [0] Ir al menu Principal                           *'
        Write-Host '************************************************************'
        Write-Host ''

        # Leer la opción del usuario
        $menu = Read-Host -Prompt "Selecciona una opción (0-9)"

        switch ($menu) {
            "1" {
                Write-Output "Seleccionaste: Instalación de DNS"
                .\Funcionalidades\DNS\1_InstalacionDeDNS.ps1
                Read-Host -Prompt "Presiona Enter para continuar..."
            }
            "2" {
                Write-Output "Seleccionaste: Creacion de punteros IPV4(Incluye Inverso)"
                .\Funcionalidades\DNS\2_CreacionDePunterosIPV4.ps1
                Read-Host -Prompt "Presiona Enter para continuar..."
            }
            "3" {
                Write-Output "Seleccionaste: Creacion de punteros IPV6(Incluye Inverso)"
                .\Funcionalidades\DNS\3_CreacionDePunterosIPV6.ps1
                Read-Host -Prompt "Presiona Enter para continuar..."
            }
            "4" {
                Write-Output "Seleccionaste: Creacion de punteros IPV6(Incluye Inverso)"
                .\Funcionalidades\DNS\4_AsignacionDeForwarders.ps1
                Read-Host -Prompt "Presiona Enter para continuar..."
            }
            
            "0" {
                Write-Output "Saliendo..."
                Start-Sleep -Seconds 3
                .\mainScript.ps1
                break
            }
            default {
                Write-Output "Opción no válida. Por favor selecciona una opción del 0 al 9."
                Read-Host -Prompt "Presiona Enter para intentar de nuevo..."
            }
        }
    }
}

# Llamada a la función para mostrar el menú
menuDNS
