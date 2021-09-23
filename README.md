# X509Details
[![PSGallery Version](https://img.shields.io/powershellgallery/v/X509Details.svg?style=flat&logo=powershell&label=PSGallery%20Version)](https://www.powershellgallery.com/packages/X509Details) [![PSGallery Downloads](https://img.shields.io/powershellgallery/dt/X509Details.svg?style=flat&logo=powershell&label=PSGallery%20Downloads)](https://www.powershellgallery.com/packages/X509Details)

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

Get-X509Details('certBase64String')

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
```

## LINKS

* [Darren Robinson's blog](https://blog.darrenjrobinson.com)
* [Associated X509Details Blogpost](https://blog.darrenjrobinson.com/x509details-powershell-module-for-decoding-x509-certificates-with-time-to-certificate-expiry/)
* [Follow Darren on Twitter](https://twitter.com/darrenjrobinson)![](http://twitter.com/favicon.ico)
