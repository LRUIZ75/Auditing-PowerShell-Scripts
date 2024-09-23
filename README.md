
# Auditing-PowerShell-Scripts

## PS Scripts para recuperar información básica de auditoría del SO Windows.

  

*El script principal a ejecutar es: **./AUDIT.PS1***

  

Dependencias: todos los archivos **./STEP-?-Get-*.ps1**, deben estar siempre en la misma carpeta que el script principal.

  

Como resultado generará elimina y vuelve a crear todos los archivos con extensiones .txt, .html, .csv y .zip en la carpeta.

  

Los archivos resultantes contienen información de:

 1. Sistema Operativo y Hardware
 2. Inventario del Software
 3. Licencias de Microsoft (Windows y Office)
 4. Usuarios Locales

  

Al final todo se comprime en un solo archivo **./AUDIFFILES.ZIP**

  
  

## Créditos

**STEP 2 - Software Inventory**

Jaap Brasser, http://www.jaapbrasser.com

Georges Zwingelstein, https://gallery.technet.microsoft.com/scriptcenter/site/profile?userName=Georges%20Zwingelstein

  

## Más info y scripts

http://www.granikos.eu/en/scripts