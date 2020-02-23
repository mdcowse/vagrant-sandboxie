Configuration RDS_install
{ 
    Node 'localhost' 
    {
        WindowsFeature RDSConnectionBroker 
        {
            Name = 'RDS-Connection-Broker'
            Ensure = 'Present'
        }
 
        WindowsFeature WebAccess 
        { 
            Name = 'RDS-Web-Access'
            Ensure = 'Present'
        }

        WindowsFeature SessionHost 
        { 
            Name = 'RDS-RD-Server'
            Ensure = 'Present'
        }
    }
}
 

#Create MOF
RDS_install

#Execute MOF
Start-DscConfiguration -Path .\RDS_install -Force -Wait -Verbose