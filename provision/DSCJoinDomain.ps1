Configuration JoinDomainConfiguration
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullorEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    Import-DscResource -Module ComputerManagementDsc

    Node 'localhost'
    {
        Computer JoinDomain
        {
            Name       = $env:COMPUTERNAME
            DomainName = 'PARTY'
            Credential = $Credential # Credential to join to domain
        }
    }
}


#Next block is using to allow password as plain text
$cd = @{
    AllNodes = @(
        @{
            NodeName = 'localhost'
            PSDscAllowPlainTextPassword = $true
         }
    )
}

#Define user and password for ADDomain deployment (also used for restore).
$password = ConvertTo-SecureString "vagrant" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential('party.hard\vagrant',$password)

#Create MOF
JoinDomainConfiguration -Credential $cred -ConfigurationData $cd

#Execute MOF
Start-DscConfiguration -Path .\JoinDomainConfiguration -Force -Wait -Verbose
