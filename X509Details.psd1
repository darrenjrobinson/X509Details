@{
    RootModule        = 'X509Details.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = '7626e2fd-9ee2-4f8d-a89c-64c4358634ad'
    Author            = 'Darren J Robinson'
    CompanyName       = 'Community'
    Copyright         = '(c) 2019 Darren J Robinson. All rights reserved.'
    Description       = 'Decode an X509 Certificate and present it as a PowerShell Object. Certificate PowerShell Object details updated to include the X509 Certificate time to expiry (timeToExpiry).'
    PowerShellVersion = '5.0.0'
    RequiredModules   = ''
    FunctionsToExport = @('Get-X509Details')
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()
}

