# About project
This is VM automated deployment laboratory project root folder and it was made for testing purpose. You can find it usefull when you will need to simulate the work of your infrastructure components or to deploy test lab.
The project built on Vagrant, Virtualbox, Powershell dsc technologies.

With this configurations you can modeling your production environment.
It means that you can automatically deploy multi-nodes environment with using ready to use configurations.
Each subfolder have own configuration and represents different deployment scenario.

## Prerequisites
You need to prepare your Windows enviroment for using this project.
To do it just run as administrator quickstart_windows.bat.
This batch will install Vagrant and VirtualBox via Chocolatey on your windows host.

## Getting Started
Open cmd or powershell, navigate to one of scnenarios described below and run

```vagrant up```

Also you may need to confirm to install additional components used in this project. 

## Scenario examples
Descriptions of ready scenarios are below:

```Localhost 1.0 - Just one workgroup windows node.```
* OS:Windows Server 2019, HW: 1 core, 1GB DDR, No roles installed.

```Localhost 1.1 - Just one workgroup windows node.```
* OS:Windows 10, HW: 2 core, 2GB DDR.

```AD 1.0 - Basic AD ready configuration. It consists of:```
* lab-dc1.party.hard - OS:Windows Server 2019, HW:1 core, 1GB DDR, Roles:Domain controller, DHCP Server

* lab-test.party.hard - OS: Windows Server 2019, HW: 1 core, 1GB DDR. Roles: Domain member.

```AD 1.1 - Basic AD ready configuration. It consists of:```
* lab-dc1.party.hard - OS:Windows Server 2019, HW:1 core, 1GB DDR, Roles:Domain controller, DHCP Server
* lab-client1.party.hard - OS: Windows 10, HW: 2 cores, 2GB DDR. Roles: Domain member.

```DFSR 1.0 - Basic Domain 2 nodes DFSR configuration.```
* lab-dc1.party.hard - OS:Windows Server 2019, HW:1 core, 1GB DDR, Roles:Domain controller, DHCP Server
* lab-dfsr1.party.hard - OS:Windows Server 2019, HW:1 core, 1GB DDR, Roles: Domain member, DFSR installed
* lab-dfsr2.party.hard - OS:Windows Server 2019, HW:1 core, 1GB DDR, Roles: Domain member, DFSR installed

```RDS 1.0 - Basic RDS deployment (Quick Start).```
* lab-dc1.party.hard - OS:Windows Server 2019, HW:1 core, 1GB DDR, Roles:Domain controller, DHCP Server
* lab-rds1.party.hard - OS:Windows Server 2019, HW:1 core, 1GB DDR, Roles: Key RDS (Session host, Connection broker, Web Access)
* lab-client1.party.hard - OS:Windows Server 2019, HW:1 core, 1GB DDR, No roles installed
