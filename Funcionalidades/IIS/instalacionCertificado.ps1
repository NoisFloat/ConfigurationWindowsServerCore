function InstalarCertificadoIIS {
    Clear-Host

    # Importar módulo de administración de IIS
    Import-Module -Name WebAdministration
    
    # Crear un certificado SSL autofirmado para el dominio www.horchata.sv
    $Cert = New-SelfSignedCertificate -DnsName "www.horchata.sv" `
        -CertStoreLocation cert:\LocalMachine\My `
        -KeyLength 2048 `
        -NotAfter (Get-Date).AddYears(1) `
        -Subject "CN=www.horchata.sv, O=Horchata SV, C=SV" `
        -Provider "Microsoft Enhanced RSA and AES Cryptographic Provider (256 bits)"
    
    # Configurar el enlace SSL en IIS
    New-WebBinding -Name "Default Web Site" -Protocol https -Port 443
    
    # Agregar el certificado SSL al enlace
    $certHash = $Cert.Thumbprint
    $certBinding = "IIS:\SslBindings\0.0.0.0!443"
    
    # Vincular el certificado al puerto 443
    New-Item -Path $certBinding -Value $certHash -Force
    
    Write-Host "Certificado SSL para www.horchata.sv instalado y configurado en IIS."
    Start-Sleep -Seconds 1
}
InstalarCertificadoIIS