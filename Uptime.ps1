<#
This script queries the last boot uptime from the Win32_OperatingSystem class.
It then calculates the difference between the time stated and time upon script execution.
#>

$lastboot = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -ExpandProperty LastBootUpTime

$uptime = New-TimeSpan -Start $lastboot -End (Get-Date) 

$days = $uptime.days

$hours = $uptime.hours

$minutes = $uptime.minutes

Write-Host "This device has not been rebooted in $days days, $hours hours, and $minutes minutes."

