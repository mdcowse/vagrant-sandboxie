Configuration RDS_configure
{
 
param 
( 
[Parameter(Mandatory=$true)]
[pscredential]$domainadmin 
)

Import-DscResource -Module xRemoteDesktopSessionHost

    Node 'localhost' 
    {        
        #xRDSessionDeployment creates and configures a deployment in RDSH.
        xRDSessionDeployment NewDeployment 
        {
            ConnectionBroker = $hostname
            SessionHost = $hostname
            WebAccessServer = $hostname
            PsDscRunAsCredential = $domainadmin
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
$domainadmin = New-Object System.Management.Automation.PSCredential('party.hard\Administrator',$password)

#Create MOF
RDS_configure -domainadmin $domainadmin -ConfigurationData $cd

#Execute MOF
Start-DscConfiguration -Path .\RDS_configure -Force -Wait -Verbose