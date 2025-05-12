$filelink = "https://nextcloud.thegreenecloud.com/public.php/dav/files/packages/rustdeskpro.exe"

$ProgressPreference = "SilentlyContinue"

$filesavename = "C:\Program Files (x86)\rustdesk.exe"

#Download the RustDesk file

Invoke-WebRequest -Uri $filelink -OutFile $filesavename -ErrorAction Stop

#Install RustDesk

if (Test-Path -Path "$filesavename"){
    
    Start-Process "$filesavename" -ArgumentList "--silent-install"

} else {
    Write-Host "File could not be found or downloaded."
}