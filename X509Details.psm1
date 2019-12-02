function Get-X509Details {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
        [string]$cert
    )

    <#
.SYNOPSIS

Decode an X509 Certificate and present it as a PowerShell Object.
Certificate PowerShell Object details updated to include the X509 Certificate time to expiry (timeToExpiry).

.DESCRIPTION

Decode an X509 Certificate and present it as a PowerShell Object.
Certificate PowerShell Object details updated to include the X509 Certificate time to expiry (timeToExpiry).

.PARAMETER cert

The X509 Certificate to decode and udpate with time to expiry

.INPUTS

Certificate from Pipeline 

.OUTPUTS

PowerShell Object

.SYNTAX

Get-X509Details(cert)

.EXAMPLE

PS> Get-X509Details('MIIDtzCCAp+gAwIBAgIQZpJpy9zmR........URpc0T9DzsUUfoHfbQ==')
or
PS> 'MIIDtzCCAp+gAwIBAgIQZpJpy9zmR........URpc0T9DzsUUfoHfbQ==' | Get-X509Details
or 
PS> Get-X509Details('@
                    -----BEGIN CERTIFICATE-----
                    MIIDtzCCAp
                    ........URpc0T9DzsUUfoHfbQ==
                    -----END CERTIFICATE-----
                    '@)

.LINK

https://blog.darrenjrobinson.com
https://blog.darrenjrobinson.com/jwtdetails-powershell-module-for-decoding-jwt-access-tokens-with-readable-token-expiry-time/ 

#>
    # Test textual encoding as per https://tools.ietf.org/html/rfc7468
    $verCertStart = "-----BEGIN CERTIFICATE-----`r`nM"
    $verCertEnd = "==`r`n-----END CERTIFICATE-----"
    if ($cert.StartsWith($verCertStart) -and $cert.EndsWith($verCertEnd)) { 
        $check = $true 
        $cert = $cert.Replace("-----BEGIN CERTIFICATE-----", "")
        $cert = $cert.Replace("-----END CERTIFICATE-----", "")
        $cert = $cert.trim()
    } 
    if (!$check) {
        if (!$cert.StartsWith("M") -and !$cert.EndsWith('=')) { 
            Write-Error "Invalid certificate or not in PEM / CER Format $($_)" -ErrorAction Stop 
        }
    }

    $certData = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2    
    try {
        $certData.Import([Convert]::FromBase64String($cert))
        Write-Verbose "Certificate:$($certData.Subject)"        

        # Time to Expiry
        $timeToExpiry = ($certData.NotAfter - (get-date))
        Write-Verbose "Days until certificatioin expiry: $($timeToExpiry)"        
        $certData | Add-Member -Type NoteProperty -Name "timeToExpiry" -Value $timeToExpiry
        return $certData | Select-Object -property Subject, Issuer, IssuerName, Thumbprint, FriendlyName, NotBefore, NotAfter, HasPrivateKey, Extensions,  DnsNameList, version, SendAsTrustedIssuer, PrivateKey, PublicKey, EnhancedKeyUsageList, timetoexpiry | Format-List
    }
    catch {
        Write-Error "Invalid certificate or not in PEM / CER Format $($_)" -ErrorAction Stop 
    }
}

Export-ModuleMember -Function 'Get-X509Details'