<# $processor = Get-CimInstance -ClassName CIM_Processor
$processor | Select-Object Name, MaxClockSpeed
$memory = Get-CimInstance -ClassName CIM_PhysicalMemory
$memory | Select-Object Capacity, Speed

$logicalDisks = Get-CimInstance -ClassName CIM_LogicalDisk
$logicalDisks | Select-Object DeviceID, FileSystem, Size, FreeSpace
$networkAdapters = Get-CimInstance -ClassName CIM_NetworkAdapter
$networkAdapters | Select-Object Name, MACAddress, Speed
$bios = Get-CimInstance -ClassName CIM_BIOSElement
$bios | Select-Object Manufacturer, Version, ReleaseDate
$battery = Get-CimInstance -ClassName CIM_Battery
$battery | Select-Object EstimatedChargeRemaining, EstimatedRunTime
$graphics = Get-CimInstance -ClassName CIM_VideoController
$graphics | Select-Object Name, AdapterRAM, DriverVersion 

Write-Host "Fetching System Summary"
&msinfo32 /report ./SystemSummary.txt /categories +startupprograms +services +runningtasks#>
Write-Host "Fetching WinGet List"
&winget list > ./WinGetList.txt

