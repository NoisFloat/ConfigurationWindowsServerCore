function menuPrincipal {
    $menu = ''
    while ($menu -ne '0') {
        Clear-Host
        Write-Host ''
        Write-Host ''
        Write-Host '*************************************************************'
        Write-Host '*                  HERRAMIENTAS DEL SISTEMA                  *'
        Write-Host '*========================================================== *'
        Write-Host '*                 Elige una opción del menú:               *'
        Write-Host '*                                                         *'
        Write-Host '*      [1] Instalación de AD-DS                           *'
        Write-Host '*      [2] No Implementado                                *'
        Write-Host '*      [3] No Implementado                                *'
        Write-Host '*      [4] No Implementado                                *'
        Write-Host '*      [5] No Implementado                                *'
        Write-Host '*      [6] No Implementado                                *'
        Write-Host '*      [7] No Implementado                                *'
        Write-Host '*      [8] No Implementado                                *'
        Write-Host '*      [9] No Implementado                                *'
        Write-Host '*                                                          *'
        Write-Host '*      [0] Salir                                          *'
        Write-Host '************************************************************'
        Write-Host ''

        # Leer la opción del usuario
        $menu = Read-Host -Prompt "Selecciona una opción"

        switch ($menu) {
            "1" {
                Write-Output "Seleccionaste: Instalación de AD-DS"
                .\Funcionalidades\1_InstalacionDeAD_DS.ps1
                Read-Host -Prompt "Presiona Enter para continuar..."
                break
            }
            "0" {
                Write-Output "Saliendo del menú..."
                break
            }
            default {
                Write-Output "Opción no válida. Por favor selecciona una opción del 1 al 9 o 0 para salir."
                Read-Host -Prompt "Presiona Enter para intentar de nuevo..."
                break
            }
        }
    }
}

# Llamada a la función para mostrar el menú
menuPrincipal
