function DescargarWebZipExtraerEnC {
    Import-Module WebAdministration
    $url = "https://github.com/NoisFloat/WebSPPCatedra/archive/refs/heads/main.zip"
    $zipFilePath = "C:\Web.zip"
    $extractPath = "C:\Web"
    # Crear la carpeta en C: si no existe
    if (-not (Test-Path -Path $extractPath)) {
        New-Item -Path $extractPath -ItemType Directory -Force
    } 
    # Descargar el archivo ZIP
    Invoke-WebRequest -Uri $url -OutFile $zipFilePath
    # Extraer el archivo ZIP
    Expand-Archive -Path $zipFilePath -DestinationPath $extractPath

    Get-WebFilePath -PSPath "IIS:\Sites\Default Web Site"
    Set-ItemProperty -PSPath "IIS:\Sites\Default Web Site" -name physicalPath -value "C:\Web\WebSPPCatedra-main"

    Write-Host "Listo"
    Start-Sleep -Seconds 1
    .\mainScript.ps1
}

DescargarWebZipExtraerEnC
