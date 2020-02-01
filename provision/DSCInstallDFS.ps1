Configuration DFSReplication_Install_Config
{   
    Node 'localhost'
    {
        WindowsFeature 'RSAT-DFS-Mgmt-Con'
        {
            Name   = 'RSAT-DFS-Mgmt-Con'
            Ensure = 'Present'
        }

        WindowsFeature 'FS-DFS-Replication'
        {
            Name   = 'FS-DFS-Replication'
            Ensure = 'Present'
        }

        File RGFolder
        {
            Ensure = "Present"
            Type = "Directory"
            Recurse = $true
            SourcePath = "C:\tmp"
            DestinationPath = "C:\DFS\"
        }
    }
}

#Create MOF
DFSReplication_Install_Config

Start-DscConfiguration -Path .\DFSReplication_Install_Config -Force -Wait -Verbose