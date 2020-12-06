![Image](../images/logo.png?raw=true)

# About scenario
This scenario allows you to deploy Microsoft SQL Server
and create VM lab environment on Windows host.
It can be useful when you need to check or test new features
that will be deployed in production environment.
Also this scenario can help you
when you are new in Microsoft SQL Server
and you want to start learning this product.

No need to store VM files on your storage permanently.
You can deploy lab environment on demand and remove when your tests will be done.

## Prerequisites
Please read README.md in project root folder.

## Getting Started
Open cmd or powershell,
navigate to vagrant-sandboxie/MSSQL_1.0 folder and run:

```vagrant up```

When deployment will be done you will be informed in console
that environment is ready to use.

Note that deployment will take some time
and it depends on you internet connection speed.
During deployment Microsoft SQL Server
and SQL Server Management Studio will be downloaded.

## Removing lab environment

Open cmd or powershell,
navigate to vagrant-sandboxie/MSSQL_1.0 folder and run:

```vagrant destroy```
