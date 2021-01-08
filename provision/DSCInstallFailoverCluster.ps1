Configuration FailoverCluster
{
    Node 'localhost'
    {
        WindowsFeature Failover-Clustering
        {
            Name = 'Failover-Clustering'
            Ensure = 'Present'
        }

        WindowsFeature RSAT-Clustering
        {
            Name = 'RSAT-Clustering'
            Ensure = 'Present'
        }

        WindowsFeature RSAT-Clustering-Mgmt
        {
            Name = 'RSAT-Clustering-Mgmt'
            Ensure = 'Present'
        }
    }
}


#Create MOF
FailoverCluster

#Execute MOF
Start-DscConfiguration -Path .\FailoverCluster -Force -Wait -Verbose
