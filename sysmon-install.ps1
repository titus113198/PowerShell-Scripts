$filelink = "https://download.sysinternals.com/files/Sysmon.zip"

$foldertocreate = "C:\Program Files (x86)\Sysmon"

$sysmonconfigfile = "https://github.com/SwiftOnSecurity/sysmon-config/raw/refs/heads/master/sysmonconfig-export.xml"

$ProgressPreference = "SilentlyContinue"

#Create the Sysmon folder

New-Item -Path $foldertocreate -ItemType Directory -ErrorAction SilentlyContinue

#Download the Sysmon .zip file from Microsoft

Invoke-WebRequest -Uri $filelink -OutFile "C:\Program Files (x86)\Sysmon\Sysmon.zip" -ErrorAction Stop

#Extract the .zip file

Expand-Archive -Path "$foldertocreate\Sysmon.zip" -DestinationPath "$foldertocreate" -ErrorAction Continue

#Download the Sysmon config file

Invoke-WebRequest -Uri $sysmonconfigfile -OutFile "$foldertocreate\sysmonconfig-export.xml" -ErrorAction Continue

if (Test-Path -Path "$foldertocreate\Sysmon64.exe"){
    
    Set-Location -Path $foldertocreate
    
    Start-Process "Sysmon64.exe" -ArgumentList "-accepteula", "-i", "sysmonconfig-export.xml"

} else {
    Write-Host "File could not be found or downloaded.`nPlease use the following URL to download Sysmon Config:`n$sysmonconfigfile"
}
