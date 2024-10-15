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
        Write-Host '*      [1] Instalación de IIS (Configuracion too)          *'
        Write-Host '*      [2] Descarga de pagina web                          *'                      
        Write-Host '*      [3] Certificar (HTTPS)                               *'
        Write-Host '*                                                          *'                     
        Write-Host '*      [0] Ir al menu Principal                           *'
        Write-Host '************************************************************'
        Write-Host ''

        # Leer la opción del usuario
        $menu = Read-Host -Prompt "Selecciona una opción (0-9)"

        switch ($menu) {
            "1" {
                Write-Output "Seleccionaste: Instalación de IIS"
                .\Funcionalidades\DNS\1_InstalacionDeDNS.ps1
                Read-Host -Prompt "Presiona Enter para continuar..."
            }
            "2" {
                Write-Output "Seleccionaste: Descarga de pagina web"
                .\Funcionalidades\DNS\2_CreacionDePunterosIPV4.ps1
                Read-Host -Prompt "Presiona Enter para continuar..."
            }
            "3" {
                Write-Output "Seleccionaste: Certificar (HTTPS) "
                .\Funcionalidades\DNS\2_CreacionDePunterosIPV4.ps1
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
