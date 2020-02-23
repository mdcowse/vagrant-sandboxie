Configuration RDS_configureGateway
{
 
    param 
    ( 
        [Parameter(Mandatory=$true)]
        [pscredential]$domainCreds 
    )

Import-DscResource -Module xRemoteDesktopSessionHost


Node 'localhost' 
    {  
    xRDServer AddGatewayServer
        {        
            Role    = 'RDS-Gateway'
            Server  = $hostname
            GatewayExternalFqdn = $hostname
            ConnectionBroker = 'lab-rds1.party.hard'
            PsDscRunAsCredential = $domainCreds
        }
        xRDGatewayConfiguration GatewayConfiguration
        {
            ConnectionBroker = 'lab-rds1.party.hard'
            GatewayServer    = $hostname
            ExternalFqdn = $hostname
            GatewayMode = 'Custom'
            LogonMethod = 'Password'
            UseCachedCredentials = $true
            BypassLocal = $false
            PsDscRunAsCredential = $domainCreds
            DependsOn = "[xRDServer]AddGatewayServer"
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

#Define host to install RDS deployment
$hostname = $env:COMPUTERNAME + '.party.hard'

#Define user and password for ADDomain deployment (also used for restore).
$password = ConvertTo-SecureString "vagrant" -AsPlainText -Force
$domainCreds = New-Object System.Management.Automation.PSCredential('party.hard\Administrator',$password)

#Create MOF
RDS_configureGateway -domainCreds $domainCreds -ConfigurationData $cd

#Execute MOF
Start-DscConfiguration -Path .\RDS_configureGateway -Force -Wait -Verbose