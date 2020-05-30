![Image](../images/logo.png?raw=true)

# About scenario
This scenario allows you to quickly deploy (~5mins) standalone trial CI/CD Bamboo
server and create VM lab environment on Windows host.
It can be useful when you need to check or test new features
that will be deployed in production environment. Also this scenario can help you
when you are new in Bamboo and you want to start learning this product.

No need to store VM files on your storage permanently.
You can deploy lab environment on demand and remove when your tests will be done.

## Prerequisites
Please read README.md in project root folder.

## Getting Started
Open cmd or powershell,
navigate to vagrant-sandboxie/Bamboo_1.0 folder and run:

```vagrant up```

When deployment will be done you will be informed in console
that environment is ready to use.

Note that you will need to enter the license key to complete the installation.

Bamboo version 7.0.4 is using to deploy by default.

## Deploy different version of Bamboo
If you need different Bamboo version to deploy just change the version variable
in vagrant-sandboxie/provision/bamboo/bamboo.yml file.

## Removing lab environment

Open cmd or powershell,
navigate to vagrant-sandboxie/Bamboo_1.0 folder and run:

```vagrant destroy```
