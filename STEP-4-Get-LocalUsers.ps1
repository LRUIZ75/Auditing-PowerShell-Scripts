<#AUTHOR: Luis Ruiz#>

$report = "./local-users.csv" 
$reportadm = "./local-adminusers.csv" 
$reportnoadm = "./local-nonadminusers.csv" 
Write-Host "Users List"
Get-WmiObject -Class Win32_UserAccount -Filter "LocalAccount='True'" | Select PSComputername, Name, Status, Disabled, AccountType, Lockout, PasswordRequired, PasswordChangeable, SID | Export-csv $report -NoTypeInformation

# wmic useraccount list full
Invoke-Command -ScriptBlock{Get-LocalGroupMember -Name 'Administradores'} | Select ObjectClass, Name, PrincipalSource | Export-csv $reportadm -NoTypeInformation
Invoke-Command -ScriptBlock{Get-LocalGroupMember -Name 'Usuarios'} | Select ObjectClass, Name, PrincipalSource | Export-csv $reportnoadm -NoTypeInformation