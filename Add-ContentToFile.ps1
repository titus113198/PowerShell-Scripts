<#
The purpose of this script is to ADD content to a file.
It supports multi-line input by only breaking when "END" is entered.
#>

param (
    [Parameter(Mandatory=$True,HelpMessage="Enter a file path to add content to.")]
    $selectedfile
)

$inputLines = @()

while ($true) {
    $line = Read-Host "Please enter a line of text. Type 'END' once you have finished entering your line(s) of text."
    if ($line -eq 'END') {
        break
    }
    $inputLines += $line
}

# Output the collected lines

$inputLines | Add-Content -Path $selectedfile
