Configuration Install-SQLServer
{

    Import-DscResource -ModuleName 'SqlServerDsc'

    node 'localhost'
    {
        WindowsFeature 'NetFramework35'
        {
            Name   = 'NET-Framework-Core'
            Ensure = 'Present'
        }

        WindowsFeature 'NetFramework45'
        {
            Name   = 'NET-Framework-45-Core'
            Ensure = 'Present'
        }

        SqlSetup 'InstallDefaultInstance'
        {
            InstanceName         = 'MSSQLSERVER'
            Features             = 'SQLENGINE'
            SQLCollation         = 'SQL_Latin1_General_CP1_CI_AS'
            SQLSysAdminAccounts  = 'Administrator'
            SourcePath           = 'D:\'
            NpEnabled            = $true
            TcpEnabled           = $true
            UpdateEnabled        = 'False'
            UseEnglish           = $true
            ForceReboot          = $false

            DependsOn            = '[WindowsFeature]NetFramework35', '[WindowsFeature]NetFramework45'
        }
    }
}

#Create MOF
Install-SQLServer
#Start Configuration
Start-DscConfiguration -Path .\Install-SQLServer -Force -Wait -Verbose
