function Test-DnsServer {
    param (
        [string]$ComputerName = "localhost"
    )
    Write-Host "Probando el estado del servidor DNS en $ComputerName..."
    Test-DnsServer -ComputerName $ComputerName
}

function Get-DnsServerConfiguration {
    Write-Host "Recuperando la configuración del servidor DNS..."
    Get-DnsServer
}

function Add-DnsRecordA {
    param (
        [string]$ZoneName,
        [string]$RecordName,
        [string]$IPv4Address
    )
    Write-Host "Agregando un registro A para $RecordName en la zona $ZoneName con la dirección $IPv4Address..."
    Add-DnsServerResourceRecordA -ZoneName $ZoneName -Name $RecordName -IPv4Address $IPv4Address
}

function Add-DnsRecordAAAA {
    param (
        [string]$ZoneName,
        [string]$RecordName,
        [string]$IPv6Address
    )
    Write-Host "Agregando un registro AAAA para $RecordName en la zona $ZoneName con la dirección $IPv6Address..."
    Add-DnsServerResourceRecordAAAA -ZoneName $ZoneName -Name $RecordName -IPv6Address $IPv6Address
}

function Create-PrimaryZone {
    param (
        [string]$ZoneName
    )
    $zone = Get-DnsServerZone -Name $ZoneName -ErrorAction SilentlyContinue
    if (-not $zone) {
        Write-Host "Creando la zona primaria $ZoneName..."
        Add-DnsServerPrimaryZone -Name $ZoneName -ZoneFile "$ZoneName.dns" -DynamicUpdate "Secure"
    } else {
        Write-Host "La zona primaria $ZoneName ya existe."
    }
}

function Set-DnsServerForwarders {
    param (
        [string]$IPv4Forwarder,
        [string]$IPv6Forwarder
    )
    Write-Host "Estableciendo el forwarder IPv4 a $IPv4Forwarder..."
    Add-DnsServerForwarder -IPAddress $IPv4Forwarder
    
    Write-Host "Estableciendo el forwarder IPv6 a $IPv6Forwarder..."
    Add-DnsServerForwarder -IPAddress $IPv6Forwarder
}

function Get-DnsServerForwarders {
    Write-Host "Obteniendo la lista de forwarders del servidor DNS..."
    Get-DnsServerForwarder
}

function Mostrar-Menu {
    cls
    Write-Host "===== Menú de Administración del Servidor DNS =====" -ForegroundColor Cyan
    Write-Host "1. Probar el estado del servidor DNS"
    Write-Host "2. Ver configuración del servidor DNS"
    Write-Host "3. Agregar un registro A"
    Write-Host "4. Agregar un registro AAAA"
    Write-Host "5. Crear una zona primaria si no existe"
    Write-Host "6. Establecer forwarders (IPv4 e IPv6)"
    Write-Host "7. Ver forwarders configurados"
    Write-Host "0. Salir"
}

function Ejecutar-Opcion {
    param (
        [int]$opcion
    )

    switch ($opcion) {
        1 {
            Test-DnsServer
        }
        2 {
            Get-DnsServerConfiguration
        }
        3 {
            $zoneName = Read-Host "Introduce el nombre de la zona"
            $recordName = Read-Host "Introduce el nombre del registro (por ejemplo: www)"
            $ipv4Address = Read-Host "Introduce la dirección IPv4 del registro"
            Add-DnsRecordA -ZoneName $zoneName -RecordName $recordName -IPv4Address $ipv4Address
        }
        4 {
            $zoneName = Read-Host "Introduce el nombre de la zona"
            $recordName = Read-Host "Introduce el nombre del registro (por ejemplo: www)"
            $ipv6Address = Read-Host "Introduce la dirección IPv6 del registro"
            Add-DnsRecordAAAA -ZoneName $zoneName -RecordName $recordName -IPv6Address $ipv6Address
        }
        5 {
            $zoneName = Read-Host "Introduce el nombre de la zona que deseas crear"
            Create-PrimaryZone -ZoneName $zoneName
        }
        6 {
            $ipv4Forwarder = Read-Host "Introduce la dirección IPv4 del forwarder"
            $ipv6Forwarder = Read-Host "Introduce la dirección IPv6 del forwarder"
            Set-DnsServerForwarders -IPv4Forwarder $ipv4Forwarder -IPv6Forwarder $ipv6Forwarder
        }
        7 {
            Get-DnsServerForwarders
        }
        0 {
            Write-Host "Saliendo del programa..." -ForegroundColor Green
            exit
        }
        default {
            Write-Host "Opción no válida, por favor intenta nuevamente." -ForegroundColor Red
        }
    }
}

# Programa principal
do {
    Mostrar-Menu
    $opcion = Read-Host "Selecciona una opción"
    Ejecutar-Opcion -opcion $opcion
    Write-Host "`nPresiona Enter para continuar..."
    [void] [System.Console]::ReadKey()  # Espera a que el usuario presione una tecla
} while ($true)
