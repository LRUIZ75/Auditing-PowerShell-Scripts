<#AUTHOR: Luis Ruiz#>

Write-Host "Microsoft Windows Status"
Get-CimInstance SoftwareLicensingProduct -Filter "Name like 'Windows%'" | where { $_.PartialProductKey } | select Description, LicenseStatus | 
       Export-Csv -UseCulture -NoTypeInformation -LiteralPath ./WindowsLicense.csv 

wmic path softwarelicensingservice get OA3xOriginalProductKey > ./WindowsKey.txt



# Local PC Microsoft Inventory Report creation
Get-CimInstance -Class Win32_Product | 
    select-object Name,Version,Caption,IdentifyingNumber,Vendor,description,installState,PScomputerName | 
       Export-Csv -UseCulture -NoTypeInformation -LiteralPath ./LocalInventorySwReport.csv

((Get-CimInstance softwarelicensingproduct -filter 'Description LIKE "Windows%" AND LicenseStatus = 1' |
Select-Object -first 1 -ExpandProperty Description ) -replace '.*(VOLUME_MAK|OEM_SLP|RETAIL|OEM_COA_NSLP|OEM_COA_SLP).*', '$1') > ./WindowsLicensingResults.txt

Write-Host "Microsoft Office Status"
((Get-CimInstance softwarelicensingproduct -filter 'Description LIKE "%Office%" AND LicenseStatus = 1' |
Select-Object -first 1 -ExpandProperty Description ) -replace '.*(VOLUME_MAK|OEM_SLP|RETAIL|OEM_COA_NSLP|OEM_COA_SLP).*', '$1') > ./OfficeLicensingResults.txt
