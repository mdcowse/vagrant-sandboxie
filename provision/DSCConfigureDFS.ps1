Configuration DFSReplicationGroup_FullMesh_Config
{
    param
    (
        [Parameter()]
        [PSCredential]
        $Credential
    )

    Import-DscResource -Module DFSDsc
    #Define Replication Group Members
    $members = Select-String -Path "C:\vagrant\Vagrantfile" -Pattern 'hostname' | foreach {$_.Line} | Select-String -Pattern '\"(\w+-\w{4,15})\"' | foreach {$_.Matches.Groups[1].Value}

    Node 'localhost'
    {        
        # Configure the Replication Group
        DFSReplicationGroup RGTest
        {
            GroupName = 'Test'
            Ensure = 'Present'
            Members = $members
            Folders = 'DFS'
            Topology = 'Fullmesh'
            PSDSCRunAsCredential = $Credential
        }

        DFSReplicationGroupFolder RGSFolder
        {
            GroupName = 'Test'
            FolderName = 'DFS'
            DirectoryNameToExclude = 'Temp'
            PSDSCRunAsCredential = $Credential
        }

        DFSReplicationGroupMembership RGMemberDFS1
        {
            GroupName = 'Test'
            FolderName = 'DFS'
            ComputerName = 'lab-dfsr2'
            ContentPath = 'c:\DFS'
            PrimaryMember = $true
            PSDSCRunAsCredential = $Credential
        }

        DFSReplicationGroupMembership RGMemberDFS2
        {
            GroupName = 'Test'
            FolderName = 'DFS'
            ComputerName = 'lab-dfsr1'
            ContentPath = 'c:\DFS'
            PSDSCRunAsCredential = $Credential
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

#Define user and password for DFSR deployment.
$password = ConvertTo-SecureString "vagrant" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential('party.hard\Administrator',$password)

#Create MOF
DFSReplicationGroup_FullMesh_Config -Credential $cred -ConfigurationData $cd

Start-DscConfiguration -Path .\DFSReplicationGroup_FullMesh_Config -Force -Wait -Verbose