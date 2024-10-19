# Configuración de Windows Server Core

Este repositorio contiene scripts de PowerShell diseñados para configurar un entorno de Windows Server Core. Los scripts permiten gestionar componentes clave como Active Directory (AD), DHCP, DNS e IIS, siguiendo un flujo ordenado.

## Tabla de Contenidos

- [Configuración de Windows Server Core](#configuración-de-windows-server-core)
  - [Tabla de Contenidos](#tabla-de-contenidos)
  - [Requisitos Previos](#requisitos-previos)
  - [Estructura del Repositorio](#estructura-del-repositorio)
  - [Instrucciones de Uso](#instrucciones-de-uso)
  - [Menú Principal](#menú-principal)
  - [Módulos Disponibles](#módulos-disponibles)
    - [Módulo de AD-DS](#módulo-de-ad-ds)
    - [Módulo de DHCP](#módulo-de-dhcp)
    - [Módulo de DNS](#módulo-de-dns)
    - [Módulo de IIS](#módulo-de-iis)
  - [Ejemplo de Uso](#ejemplo-de-uso)

## Requisitos Previos

- **Sistema Operativo**: Este conjunto de scripts ha sido probado únicamente en Windows Server 2022 y 2019.
- **Conectado a Default Switch**: En casos de Hyper-V.
- **Configuración de Red**:
  - **NetBIOS**: Debe ser `HORCHATA`.
  - **Forest de AD-DS**: Debe ser `horchata.sv`.
  - **Direcciones IP**:
    - IPv4: `172.16.0.2/24`
    - IPv6: `2001:DB8:DEA:B::2`

## Estructura del Repositorio

- **DescargarEsto.ps1**: Script para descargar el último commit de la rama `main`. Ejecútalo en la raíz del disco `C:/` para obtener la carpeta de scripts.
- **arreglarProblemasDeEjecucion.txt**: 
  - Permite la ejecución de scripts en la sesión actual de PowerShell.
  - Configura la dirección IPv6 utilizando el comando `New-NetIPAddress`.
- **mainScript.ps1**: Menú principal que permite acceder a los distintos módulos de configuración.

## Instrucciones de Uso

1. **Preparación del Entorno**:
    - Asegúrate de que tu servidor esté en una red con las configuraciones IP mencionadas.

2. **Ejecutar Scripts (En caso de tener problemas puedes revisar primero `arreglarProblemasDeEjecucion.txt`):**
    - Ejecuta `DescargarEsto.ps1` en `C:/` para obtener los scripts necesarios.
    - Por favor, revisa el archivo `arreglarProblemasDeEjecucion.txt` y asegúrate de ejecutar sus CMDlets.
    - Ejecuta `mainScript.ps1` y selecciona las opciones del menú.
    - Configura el NetBIOS y el forest de AD-DS según los requisitos previos (utilizando el mainScript.ps1).

    *(Recuerda que está preparado para forest = horchata.sv y NetBios = HORCHATA)*
    - [Requisitos Previos](#requisitos-previos)

    


## Menú Principal
- Ejecuta los comandos descritos en `arreglarProblemasDeEjecucion.txt` para permitir la ejecución de scripts.
El menú principal de `mainScript.ps1` ofrece las siguientes opciones:

1. **Módulo de AD-DS**
   - Opción 1: Instalación de AD-DS
   - Opción 2: Creación de Unidades Organizativas (OU)
   - Opción 3: Creación de Usuarios para el Dominio: `horchata.sv`
2. **Módulo de DHCP**
   - Opción 1: Instalación de DHCP
   - Opción 2: Asignación de Servidor DNS y Pool DHCP (Estático IPv4 - IPv6)
3. **Módulo de DNS**
   - Opción 1: Instalación de DNS
   - Opción 2: Creación de punteros IPv4 (Incluye Inverso)
   - Opción 3: Creación de punteros IPv6 (Incluye Inverso)
   - Opción 4: Asignación de Forwarders (IPv4 - IPv6)
4. **Módulo de IIS**
    - Opción 1: Instalación de IIS (Configuración)
   - Opción 2: Descarga de página web
   - Opción 3: Certificación (HTTPS)
5. **Salir**

## Módulos Disponibles

### Módulo de AD-DS
- Opción 1: Instalación de AD-DS
- Opción 2: Creación de Unidades Organizativas (OU)
- Opción 3: Creación de Usuarios para el Dominio: `horchata.sv`

### Módulo de DHCP
- Opción 1: Instalación de DHCP
- Opción 2: Asignación de Servidor DNS y Pool DHCP (Estático IPv4 - IPv6)

### Módulo de DNS
- Opción 1: Instalación de DNS
- Opción 2: Creación de punteros IPv4 (Incluye Inverso)
- Opción 3: Creación de punteros IPv6 (Incluye Inverso)
- Opción 4: Asignación de Forwarders (IPv4 - IPv6)

### Módulo de IIS
- Opción 1: Instalación de IIS (Configuración)
- Opción 2: Descarga de página web
- Opción 3: Certificación (HTTPS)


## Ejemplo de Uso

Para ejecutar el script `mainScript.ps1`, sigue los pasos a continuación:

1. **Ejecuta el script:**
    ```powershell
    .\mainScript.ps1
    ```
    Selecciona el módulo de AD-DS y ejecuta las opciones en el siguiente orden:
    1. Opción 1
    2. Opción 2
    3. Opción 3
    
    *(Recuerda que está preparado para forest = horchata.sv y NetBios = HORCHATA)*[Requisitos](#requisitos-previos).

2. **Continúa con el módulo de DHCP** y ejecuta las opciones en el orden de [Modulos Disponibles - DHCP](#módulo-de-dhcp).

3. **Procede al módulo de DNS** y ejecuta las opciones en el orden de [Modulos Disponibles - DNS](#módulo-de-dns).

4. **Finaliza con el módulo de IIS**, ejecutando cada opción como se indica en el orden de [Modulos Disponibles - IIS](#módulo-de-iis).

Asegúrate de seguir las instrucciones en pantalla para completar cada paso correctamente.

¡Listo para usar!
