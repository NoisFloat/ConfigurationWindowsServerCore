function InstalarCertificadoIIS {
    Clear-Host

    # Importar módulo de administración de IIS
    Import-Module -Name WebAdministration
    
    # Crear un certificado SSL autofirmado para el dominio www.horchata.sv
    Install-WindowsFeature -Name Web-Server -IncludeManagementTools

    New-SelfSignedCertificate -DnsName "www.horchata.sv" -CertStoreLocation "cert:\LocalMachine\My" 

    $cert = Get-ChildItem -Path Cert:\LocalMachine\My | Where-Object {$_.Subject -like "*www.horchata.sv*"}

    New-WebBinding -Name "www.horchata.sv" -Protocol "https" -Port 443 -IPAddress * -SslFlags 1 -HostHeader "www.horchata.sv"

    (Get-WebBinding -Name "www.horchata.sv" -Protocol "https").AddSslCertificate($cert.Thumbprint, "My")
    
    Write-Host "Certificado SSL para www.horchata.sv instalado y configurado en IIS."
    Start-Sleep -Seconds 1
}
InstalarCertificadoIIS