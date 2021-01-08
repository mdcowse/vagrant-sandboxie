Configuration HostsFile_AddEntry_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        HostsFile HostsFileAddEntry1
        {
            HostName  = 'lab-sql1.party.hard'
            IPAddress = '192.168.11.2'
            Ensure    = 'Present'
        }
        HostsFile HostsFileAddEntry2
        {
            HostName  = 'lab-sql1'
            IPAddress = '192.168.11.2'
            Ensure    = 'Present'
        }
        HostsFile HostsFileAddEntry3
        {
            HostName  = 'lab-sql2.party.hard'
            IPAddress = '192.168.11.3'
            Ensure    = 'Present'
        }
        HostsFile HostsFileAddEntry4
        {
            HostName  = 'lab-sql2'
            IPAddress = '192.168.11.3'
            Ensure    = 'Present'
        }
        HostsFile HostsFileAddEntry5
        {
            HostName  = 'lab-witness.party.hard'
            IPAddress = '192.168.11.4'
            Ensure    = 'Present'
        }
        HostsFile HostsFileAddEntry6
        {
            HostName  = 'lab-witnress'
            IPAddress = '192.168.11.4'
            Ensure    = 'Present'
        }
        HostsFile HostsFileAddEntry7
        {
            HostName  = 'listener.party.hard'
            IPAddress = '192.168.11.11'
            Ensure    = 'Present'
        }
        HostsFile HostsFileAddEntry8
        {
            HostName  = 'listener'
            IPAddress = '192.168.11.11'
            Ensure    = 'Present'
        }
        HostsFile HostsFileAddEntry9
        {
            HostName  = 'cluster'
            IPAddress = '192.168.11.10'
            Ensure    = 'Present'
        }
        HostsFile HostsFileAddEntry10
        {
            HostName  = 'cluster.party.hard'
            IPAddress = '192.168.11.10'
            Ensure    = 'Present'
        }
    }
}

HostsFile_AddEntry_Config

Start-DscConfiguration -Path .\HostsFile_AddEntry_Config -Force -Wait -Verbose
