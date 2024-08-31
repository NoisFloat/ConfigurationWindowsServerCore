function DescargarZipExtraerEnC {
    $url = "https://github.com/NoisFloat/ConfiguracionWindowsServerCore/archive/refs/heads/main.zip"
    $zipFilePath = "C:\main.zip"
    $extractPath = "C:\ProyectoDeCatedraScripts"
    # Crear la carpeta en C: si no existe
    if (-not (Test-Path -Path $extractPath)) {
        New-Item -Path $extractPath -ItemType Directory -Force
    } 
    # Descargar el archivo ZIP
    Invoke-WebRequest -Uri $url -OutFile $zipFilePath
    # Extraer el archivo ZIP
    Expand-Archive -Path $zipFilePath -DestinationPath $extractPath
}

DescargarZipExtraerEnC
