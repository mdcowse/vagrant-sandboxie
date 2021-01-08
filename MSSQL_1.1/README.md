![Image](../images/logo.png?raw=true)

# About scenario
This scenario will deploy two SQL Servers in Failover cluster configuration
with witness.
Also SQL Server Management Studio and AdventureWorks test database
on the first host will be deployed.

## Prerequisites
Please read README.md in project root folder.

## Getting Started
Open cmd or powershell,
navigate to vagrant-sandboxie/MSSQL_1.1 folder and run:

```vagrant up```

When deployment will be done you will be informed in console
that environment is ready to use.

Note that deployment will take some time
and it depends on you internet connection speed.
During deployment Microsoft SQL Server
and SQL Server Management Studio will be downloaded.

## Removing lab environment

Open cmd or powershell,
navigate to vagrant-sandboxie/MSSQL_1.1 folder and run:

```vagrant destroy```
