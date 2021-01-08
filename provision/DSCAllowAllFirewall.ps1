Configuration Firewall_AddFirewallRule_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        Firewall AddFirewallRule
        {
            Name                  = 'AllowAllFirewallRule'
            DisplayName           = 'AllowAllFirewallRule'
            Ensure                = 'Present'
            Enabled               = 'True'
            Profile               = ('Domain', 'Private', 'Public')
            Direction             = 'InBound'
            Protocol              = 'Any'
        }
    }
 }
 Firewall_AddFirewallRule_Config
 Start-DscConfiguration ./Firewall_AddFirewallRule_Config -Force -Wait -Verbose
