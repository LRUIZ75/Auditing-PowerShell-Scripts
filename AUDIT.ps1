<# 

  .SYNOPSIS 
  Scripts para auditar equipos basdados en Windows.

  Autores: Luis Ruiz et al.

    ESTOS SCRIPTS SE PROPORCIONAN TAL CUAL, SIN GARANTÍAS DE NINGUNA CLASE. 
    EL RIESGO DE SU USO O DEL RESUTLADO, QUEDA A SU ENTERA RESPONSABILIDAD.

  Version 1.0, 2024-02-06

  Ideas y sugerencias, favor enviarlas a Luis Ruiz / lruiz75@gmail.com 

  .LINK 
  https://github.com/LRUIZ75/Auditing-PowerShell-Scripts

  .DESCRIPTION 
  Estos scripts son una recopilación de métodos e ideas previamente probadas por otros autores.
  Para información actualizada revise el archivo https://github.com/LRUIZ75/Auditing-PowerShell-Scripts/blob/main/README.md
     
  .NOTES 
  Requirements 
  - Windows 10, 11, Server 2012+  
  - Remote Registry
  - PowerShell 7
    
  Revisiones 
  -------------------------------------------------------------------------------- 
  1.0      Revisión inicial para despliegue

  .EXAMPLE 
  .\AUDIT.ps1


#>

Clear-Host
$paths =  "./*.txt", "./*.html", "./*.zip", "./*.csv"
foreach($filePath in $paths)
{
    if (Test-Path $filePath) {
        Remove-Item $filePath -verbose
    } else {
        Write-Host "Path doesn't exits " + $filePath
    }
}
Write-Host "Starting Audit"
& ./STEP-1-Get-SystemInfo.ps1
& ./STEP-2-Get-SoftwareInventory.ps1
& ./STEP-3-Get-MicrosoftLicensing.ps1
& ./STEP-4-Get-LocalUsers.ps1
Write-Host "Compressing Files"
& Compress-Archive -Path ./* -CompressionLevel Optimal -DestinationPath ./AUDITFILES.zip -Force