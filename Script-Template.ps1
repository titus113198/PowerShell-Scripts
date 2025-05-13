# Set error log location and naming convention.

$errorLog = "C:\Users\Titus\Downloads\PowerShell_$(Get-Date -Format yyyyMMdd).log"

# Create the error log.

if (!(Test-Path -Path $errorLog)){
    New-Item -Path $errorLog -ItemType File
    Add-Content -Path $errorLog -Value "The timezone is $((Get-TimeZone).StandardName).`n"
}

#Logging Function
function Log-Error {
    param (
        $ErrorRecord,
        $CustomMessage
    )

    #Detailed Error Info
    $errorDetails = @"
-------------------------------
    Date: $(Get-Date)
    Custom Message: $CustomMessage
    Error Message: $($ErrorRecord.exception.message)
    Error Type: $($ErrorRecord.exception.GetType().FullName)
    Script Line: $($ErrorRecord.InvocationInfo.ScriptLineNumber)
    Script Name: $($ErrorRecord.InvocationInfo.ScriptName)
    Invocation Name: $($ErrorRecord.InvocationInfo.InvocationName)
    Position Message: $($ErrorRecord.InvocationInfo.PositionMessage)
    Stack Trace: $($ErrorRecord.ScriptStackTrace)
"@
    # Append error details to log file
    Add-Content -path $errorLog -Value $errorDetails
    Write-Host "Error logged. Please review $errorLog for details."
    }
    # How to use error logger?: Log-Error -ErrorRecord $_ -CustomMessage "<insert custom error message>"


try {
    $toedit = Read-Host "Enter the path of the file you are trying to add content to."
    Get-Content -Path $toedit -ErrorAction Stop
}
catch {
    <#Do this if a terminating exception happens#>
    Log-Error -ErrorRecord $_ -CustomMessage "Script has failed."
    Write-Warning "Something may have went wrong."
}
finally {
    <#Do this after the try block regardless of whether an exception occurred or not#>
    Write-Host "This is your finally block."
}