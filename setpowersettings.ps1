<#
Setting any value to 0 will set the timeout=Never

AC settings are used when the system is on AC power.
 
DC settings on battery power.

Reference URL: https://ss64.com/nt/powercfg.html

#>

powercfg /change monitor-timeout-ac 0

powercfg /change monitor-timeout-dc 0