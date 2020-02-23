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
        #xRDSessionCollection creates an RDSH collection.
        xRDSessionCollection collection 
        {
            CollectionName = 'CollectionName'
            SessionHost = $hostname
            ConnectionBroker = $hostname
            PsDscRunAsCredential = $domainadmin
        }
        #xRDSessionCollectionConfiguration configures an RDSH collection.
        xRDSessionCollectionConfiguration collectionconfig 
        {
            CollectionName = 'CollectionName'
            ConnectionBroker = $hostname
            UserGroup = 'Domain Users'
            DependsOn = '[xRDSessionCollection]collection'
            PsDscRunAsCredential = $domainadmin
        } 
        #xRDLicenseConfiguration creates and configures RD Licensing server.
        xRDLicenseConfiguration licenseconfig 
        { 
            ConnectionBroker = $hostname
            LicenseServer = $hostname
            LicenseMode = 'PerUser'
            DependsOn = '[xRDSessionCollectionConfiguration]collectionconfig'
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