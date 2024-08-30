param (
    [int]$thresholdGB = 20  # Default value is 20 GB if not provided
)

# Get the available free space for C: drive
$drive = Get-PSDrive C
$freeSpaceGB = [math]::round($drive.Free / 1GB, 2)

# Check if the free space is less than the threshold
if ($freeSpaceGB -lt $thresholdGB) {
    Write-Host "Insufficient disk space on C: drive. Only $freeSpaceGB GB available, which is less than the required $thresholdGB GB."
    exit 1  # Exit with a failure code
} else {
    Write-Host "Sufficient disk space available on C: drive. $freeSpaceGB GB free."
    exit 0  # Exit with a success code
}

# Call the function for a specific threshold

.\freediskspace.ps1 -thresholdGB [INSERT NUMBER]