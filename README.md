# X509Details
Decode an X509 Certificate and present it as a PowerShell Object.
Certificate PowerShell Object details updated to include the X509 Certificate time to expiry (timeToExpiry).

[Available in the PowerShell Gallery](https://www.powershellgallery.com/packages/X509Details)

[Associated Blogpost](https://blog.darrenjrobinson.com/x509details-powershell-module-for-decoding-x509-certificates-with-time-to-certificate-expiry/)

## Install
Install direct from the PowerShell Gallery (Powershell 5.x and above)
```
install-module -name X509Details
```

## DESCRIPTION

Decode an X509 Certificate and present it as a PowerShell Object.
Certificate PowerShell Object details updated to include the X509 Certificate time to expiry (timeToExpiry).

## PARAMETER cert

The X509 Certificate to decode and udpate with time to expiry

## INPUTS

Certificate from Pipeline.

## OUTPUTS

PowerShell Object

## SYNTAX 

Get-X509Details('accesstoken')

## EXAMPLE

```
PS> Get-X509Details('MIIDtzCCAp+gAwIBAgIQZpJpy9zmR........URpc0T9DzsUUfoHfbQ==')
or
PS> 'MIIDtzCCAp+gAwIBAgIQZpJpy9zmR........URpc0T9DzsUUfoHfbQ==' | Get-X509Details
or 
PS> Get-X509Details('-----BEGIN CERTIFICATE-----
                    MIIDtzCCAp
                    ........URpc0T9DzsUUfoHfbQ==
                    -----END CERTIFICATE-----
                    ')


## LINK

https://blog.darrenjrobinson.com 
https://blog.darrenjrobinson.com/x509details-powershell-module-for-decoding-x509-certificates-with-time-to-certificate-expiry/ 

```
