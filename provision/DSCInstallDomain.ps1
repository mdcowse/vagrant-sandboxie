Configuration ADDomain_NewForest_Config
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        $SafeModePassword
    )

    Import-DscResource -ModuleName PSDscResources
    Import-DscResource -ModuleName ActiveDirectoryDsc
    Import-DscResource -ModuleName ComputerManagementDsc

    Node 'localhost'
    {
        WindowsFeature 'Active Directory Domain Services'
        {
            Name   = 'AD-Domain-Services'
            Ensure = 'Present'
        }

        WindowsFeature 'RSAT-ADDS'
        {
            Name   = 'RSAT-ADDS'
            Ensure = 'Present'
        }
        
        ADDomain 'party.hard'
        {
            DomainName                    = 'party.hard'
            Credential                    = $Credential
            SafemodeAdministratorPassword = $SafeModePassword
            ForestMode                    = 'WinThreshold'
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
$password = ConvertTo-SecureString "RestorePassword123$" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential('vagrant',$password)

#Create MOF
ADDomain_NewForest_Config -Credential $cred -SafeModePassword $cred -ConfigurationData $cd

#Execute MOF
Start-DscConfiguration -Path .\ADDomain_NewForest_Config -Force -Wait -Verbose
