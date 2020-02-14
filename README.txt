This is VM automated deployment laboratory project root folder. It was made for testing purpose.
The project built on vagrant, virtualbox, powershell dsc technologies.

With this configurations you can modeling your production environment.
It means that you can automatically deploy multi-nodes environment with using ready to use configurations.
Each subfolder have own configuration and represents different deployment scenario.

Descriptions of ready scenarios are below:

1.0 - Just one workgroup windows node.
	1) OS:Windows Server 2019, HW: 1 core, 1GB DDR, No roles installed.
1.1 - Just one workgroup windows node.
	1) OS:Windows 10, HW: 2 core, 2GB DDR.

2.0 - Basic AD ready configuration. It consists of:
	1) lab-dc1.party.hard - OS:Windows Server 2019, HW:1 core, 1GB DDR, Roles:Domain controller, DHCP Server
	2) lab-test.party.hard - OS: Windows Server 2019, HW: 1 core, 1GB DDR. Roles: Domain member.

2.1 - Basic AD ready configuration. It consists of:
	1) lab-dc1.party.hard - OS:Windows Server 2019, HW:1 core, 1GB DDR, Roles:Domain controller, DHCP Server
	2) lab-client1.party.hard - OS: Windows 10, HW: 2 cores, 2GB DDR. Roles: Domain member.

3.0 - Basic Domain 2 nodes DFSR configuration.
	1) lab-dc1.party.hard - OS:Windows Server 2019, HW:1 core, 1GB DDR, Roles:Domain controller, DHCP Server
	2) lab-dfsr1.party.hard - OS:Windows Server 2019, HW:1 core, 1GB DDR, Roles: Domain member, DFSR installed
	3) lab-dfsr2.party.hard - OS:Windows Server 2019, HW:1 core, 1GB DDR, Roles: Domain member, DFSR installed
