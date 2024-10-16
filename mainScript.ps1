function menuPrincipal {
    $menu = ''
    while ($menu -ne '0') {
        Clear-Host
        Write-Host ''
        Write-Host ''
        Write-Host '*************************************************************'
        Write-Host '*                  HERRAMIENTAS DEL SISTEMA                  *'
        Write-Host '*==========================================================*'
        Write-Host '*                 Elige una opción del menú:               *'
        Write-Host '*                                                         *'
        Write-Host '*      [1] Modulo de AD-DS                                *'
        Write-Host '*      [2] Modulo de DHCP                                 *'
        Write-Host '*      [3] Modulo de DNS                                  *'
        Write-Host '*      [4] Modulo de IIS                                *'
        Write-Host '*      [5] Demostraciones Catedra                                *'
        Write-Host '*      [6] No Implementado                                *'
        Write-Host '*      [7] No Implementado                                *'
        Write-Host '*      [8] No Implementado                                *'
        Write-Host '*      [9] No Implementado                                *'
        Write-Host '*                                                         *'
        Write-Host '*      [0] Salir                                          *'
        Write-Host '************************************************************'
        Write-Host ''

        # Leer la opción del usuario
        $menu = Read-Host -Prompt "Selecciona una opción (0-9)"

        switch ($menu) {
            "1" {
                Write-Output "Seleccionaste: Instalación de AD-DS"
                .\Funcionalidades\AD_DS\menuAD_DS.ps1
                Read-Host -Prompt "Presiona Enter para continuar..."
            }
            "2" {
                Write-Output "Seleccionaste: Modulo de DHCP"
                .\Funcionalidades\DHCP\menuDHCP.ps1
                Read-Host -Prompt "Presiona Enter para continuar..."
            }
            "3" {
                Write-Output "Seleccionaste: Modulo de DNS"
                .\Funcionalidades\DNS\menuDNS.ps1
                Read-Host -Prompt "Presiona Enter para continuar..."
            }
            "4"{
                Write-Output "Seleccionaste: Modulo de IIS"
                .\Funcionalidades\IIS\menuIIS.ps1
                Read-Host -Prompt "Presiona Enter para continuar..."
            }
            "5"{
                Write-Output "Seleccionaste: Demostraciones De Catedra"
                .\Funcionalidades\DemostracionesCatedra\ImplementacionDeCsharp.ps1
                Read-Host -Prompt "Presiona Enter para continuar..."
            }
            "0" {
                Write-Output "Saliendo..."
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
menuPrincipal
