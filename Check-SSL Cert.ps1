function Check-SSLCertificate {
    param (
        [string]$website = "https://dashboard.am.remote.management"
    )

    try {
        # Create a request to the website
        $request = [System.Net.HttpWebRequest]::Create($website)
        $request.ServerCertificateValidationCallback = { $true }
        $response = $request.GetResponse()

        # Get the SSL certificate information
        $cert = $request.ServicePoint.Certificate
        $cert2 = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($cert)

        # Output certificate details
        $certInfo = [PSCustomObject]@{
            Website        = $website
            Subject        = $cert2.Subject
            Issuer         = $cert2.Issuer
            ExpirationDate = $cert2.NotAfter
            DaysToExpire   = (New-TimeSpan -Start (Get-Date) -End $cert2.NotAfter).Days
        }

        return $certInfo
    } catch {
        Write-Error "An error occurred: $_"
    }
}

# Call the function
Check-SSLCertificate

# Call the function for a specific website

# Check-SSLCertificate -Website "INSERT_URL"